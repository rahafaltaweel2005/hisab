import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/add_project_use_case.dart';
import '../state/add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  final AddProjectUseCase addProjectUseCase;

  AddProjectCubit({required this.addProjectUseCase})
    : super(AddProjectInitialState());

  Future<void> appProject({
    required int projectNumber,
    required String description,
    required double paidAmount,
    required double receivedAmount,
    required double walletAmount,
  }) async {
    emit(AddProjectLoadingState());
    try {
      final project = await addProjectUseCase(
        projectNumber: projectNumber,
        description: description,
        paidAmount: paidAmount,
        receivedAmount: receivedAmount,
        walletAmount: walletAmount,
      );
      emit(AddProjectSuccessState(project: project));
    } catch (error) {
      emit(AddProjectErrorState(message: error.toString()));
    }
  }
}
