import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/auth/domain/usecase/logout_use_case.dart';
import 'package:hiasb_app/features/auth/presentation/logout/state/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitialState());

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await logoutUseCase.call();
      emit(LogoutSuccessState());
    } catch (error) {
      emit(LogoutErrorState(message: error.toString()));
    }
  }
}
