import 'package:hiasb_app/core/entities/user_entity.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserEntity user;

  RegisterSuccessState({required this.user});
}

class RegisterErrorState extends RegisterState {
  final String message;

  RegisterErrorState({required this.message});
}
