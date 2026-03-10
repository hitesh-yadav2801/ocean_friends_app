import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String name;
  final String avatarUrl;

  const UserLoaded({required this.name, required this.avatarUrl});

  @override
  List<Object> get props => [name, avatarUrl];
}

class UserError extends UserState {}
