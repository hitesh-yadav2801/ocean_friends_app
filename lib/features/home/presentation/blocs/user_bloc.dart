import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ocean_friends_app/features/home/data/services/user_service.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_event.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(UserInitial()) {
    on<FetchUserProfile>((event, emit) async {
      emit(UserLoading());
      final result = await _userService.getRandomUser();
      
      // If result is null, we provide a default fallback here in the Bloc
      final userData = result ?? {
        'name': 'Jay',
        'avatar': 'https://i.pravatar.cc/150?img=68',
      };

      emit(UserLoaded(
        name: userData['name']!,
        avatarUrl: userData['avatar']!,
      ));
    });
  }
}
