import 'package:hiasb_app/features/auth/domain/entity/login_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginEntity user;

  LoginSuccessState({required this.user});
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}
