import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_search_state.freezed.dart';

@freezed
class VoiceSearchState with _$VoiceSearchState {
  /// Speech recognition is idle — mic button shows default state.
  const factory VoiceSearchState.idle() = VoiceSearchIdle;

  /// Microphone is actively listening for user speech.
  const factory VoiceSearchState.listening({
    @Default('') String partialText,
  }) = VoiceSearchListening;

  /// Speech has been recognised and is ready for search dispatch.
  const factory VoiceSearchState.done(String recognisedText) = VoiceSearchDone;

  /// An error occurred (permission denied, no speech detected, etc.).
  const factory VoiceSearchState.error(String message) = VoiceSearchError;
}
