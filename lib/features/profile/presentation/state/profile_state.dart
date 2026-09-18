import '../../../../core/entities/user_entity.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final UserEntity user;

  ProfileLoadedState({required this.user});
}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState({required this.message});
}
