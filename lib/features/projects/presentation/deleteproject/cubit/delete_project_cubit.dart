import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/delete_project_use_case.dart';
import '../state/delete_project_state.dart';

class DeleteProjectCubit extends Cubit<DeleteProjectState> {
  final DeleteProjectUseCase deleteProjectUseCase;

  DeleteProjectCubit({required this.deleteProjectUseCase})
    : super(DeleteProjectInitialState());

  Future<void> deleteProject({required int projectId}) async {
    emit(DeleteProjectLoadingState());
    try {
      await deleteProjectUseCase(projectId: projectId);
      emit(DeleteProjectSuccessState());
    } catch (error) {
      emit(DeleteProjectErrorState(message: error.toString()));
    }
  }
}
