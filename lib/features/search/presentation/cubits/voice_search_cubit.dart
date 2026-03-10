import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:ocean_friends_app/core/utils/app_logger.dart';
import 'package:ocean_friends_app/features/search/presentation/cubits/voice_search_state.dart';

/// Manages the speech-to-text lifecycle for voice-driven recipe search.
///
/// States flow: idle → listening → done (or error) → idle.
@injectable
class VoiceSearchCubit extends Cubit<VoiceSearchState> {
  VoiceSearchCubit() : super(const VoiceSearchState.idle());

  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialised = false;

  /// Starts listening for user speech.
  ///
  /// Requests permissions on first call, then begins recognition.
  Future<void> startListening() async {
    try {
      if (!_isInitialised) {
        _isInitialised = await _speech.initialize(
          onError: (error) {
            AppLogger.w('Speech error: ${error.errorMsg}');
            if (error.permanent) {
              emit(
                const VoiceSearchState.error(
                  'Speech recognition is not available on this device.',
                ),
              );
            }
          },
          onStatus: (status) {
            AppLogger.d('Speech status: $status');
            if (status == 'done' || status == 'notListening') {
              _onListeningFinished();
            }
          },
        );
      }

      if (!_isInitialised) {
        emit(
          const VoiceSearchState.error(
            'Microphone permission denied. Please enable it in Settings.',
          ),
        );
        return;
      }

      emit(const VoiceSearchState.listening());

      await _speech.listen(
        onResult: (result) {
          if (result.finalResult) {
            final text = result.recognizedWords.trim();
            if (text.isEmpty) {
              emit(
                const VoiceSearchState.error(
                  'No speech detected. Please try again.',
                ),
              );
            } else {
              emit(VoiceSearchState.done(text));
            }
          } else {
            emit(
              VoiceSearchState.listening(
                partialText: result.recognizedWords,
              ),
            );
          }
        },
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 3),
        listenMode: stt.ListenMode.search,
      );
    } on Exception catch (e) {
      AppLogger.e('Voice search error', error: e);
      emit(VoiceSearchState.error('Voice search failed: $e'));
    }
  }

  /// Stops listening and returns to idle.
  Future<void> stopListening() async {
    await _speech.stop();
    _onListeningFinished();
  }

  /// Resets the cubit back to idle state.
  void reset() {
    emit(const VoiceSearchState.idle());
  }

  void _onListeningFinished() {
    // Only reset if we're still in listening state without a final result.
    state.whenOrNull(
      listening: (partialText) {
        if (partialText.trim().isNotEmpty) {
          emit(VoiceSearchState.done(partialText.trim()));
        } else {
          emit(
            const VoiceSearchState.error(
              'No speech detected. Please try again.',
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    _speech
      ..stop()
      ..cancel();
    return super.close();
  }
}
