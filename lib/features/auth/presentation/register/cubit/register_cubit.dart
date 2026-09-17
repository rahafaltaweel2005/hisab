import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/auth/domain/usecase/register_use_case.dart';
import 'package:hiasb_app/features/auth/presentation/register/state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(RegisterInitialState());

  Future<void> register({
    required String displayName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final result = await registerUseCase.call(
        displayName: displayName,
        email: email,
        password: password,
      );
      emit(RegisterSuccessState(user: result));
    } catch (error) {
      emit(RegisterErrorState(message: error.toString()));
    }
  }
}
