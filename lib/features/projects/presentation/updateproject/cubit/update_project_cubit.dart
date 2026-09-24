import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/update_project_use_case.dart';
import '../state/update_project_state.dart';

class UpdateProjectCubit extends Cubit<UpdateProjectState> {
  final UpdateProjectUseCase updateProjectUseCase;

  UpdateProjectCubit({required this.updateProjectUseCase})
    : super(UpdateProjectInitialState());

  Future<void> updateProject({
    required int projectId,

    int? projectNumber,
    String? description,
    double? paidAmount,
    double? receivedAmount,
    double? walletAmount,
  }) async {
    emit(UpdateProjectLoadingState());
    try {
      final project = await updateProjectUseCase(
        projectId: projectId,
        projectNumber: projectNumber,
        description: description,
        paidAmount: paidAmount,
        receivedAmount: receivedAmount,
        walletAmount: walletAmount,
      );
      emit(UpdateProjectSuccessState(project: project));
    } catch (error) {
      emit(UpdateProjectErrorState(message: error.toString()));
    }
  }
}
