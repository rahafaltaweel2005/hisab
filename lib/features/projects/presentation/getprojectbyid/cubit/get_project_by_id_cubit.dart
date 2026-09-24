import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_project_by_id_use_case.dart';
import '../state/get_project_by_id_state.dart';

class GetProjectByIdCubit extends Cubit<GetProjectByIdState> {
  final GetProjectByIdUseCase getProjectByIdUseCase;

  GetProjectByIdCubit({required this.getProjectByIdUseCase})
    : super(GetProjectByIdInitialState());

  Future<void> getProjectById({required int projectId}) async {
    emit(GetProjectByIdLoadingState());
    try {
      final project = await getProjectByIdUseCase(projectId: projectId);
      emit(GetProjectByIdLoadedState(project: project));
    } catch (error) {
      emit(GetProjectByIdErrorState(message: error.toString()));
    }
  }
}
