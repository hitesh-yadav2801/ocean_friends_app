import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocean_friends_app/features/home/data/services/user_service.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_event.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(UserInitial()) {
    on<FetchUserProfile>((event, emit) async {
      emit(UserLoading());
      final result = await _userService.getRandomUser();
      if (result['name'] != null) {
        emit(UserLoaded(
          name: result['name']!,
          avatarUrl: result['avatar']!,
        ));
      } else {
        emit(UserError());
      }
    });
  }
}
