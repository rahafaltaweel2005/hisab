import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/auth/domain/usecase/login_use_case.dart';
import 'package:hiasb_app/features/auth/presentation/login/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      final result = await loginUseCase.call(email: email, password: password);
      emit(LoginSuccessState(user: result));
    } catch (error) {
      emit(LoginErrorState(message: error.toString()));
    }
  }
}
