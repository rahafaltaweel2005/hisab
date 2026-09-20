import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_projects_use_case.dart';
import '../state/get_projects_state.dart';

class GetProjectsCubit extends Cubit<GetProjectsState> {
  final GetProjectsUseCase getProjectsUseCase;

  GetProjectsCubit({required this.getProjectsUseCase})
    : super(GetProjectsInitialState());

  Future<void> getProjects({
    required int pageNumber,
    required int pageSize,
    String? search,
  }) async {
    emit(GetProjectsLoadingState());
    try {
      final projects = await getProjectsUseCase(
        pageNumber: pageNumber,
        pageSize: pageSize,
        search: search,
      );
      emit(GetProjectsLoadedState(projects: projects));
    } catch (error) {
      emit(GetProjectsErrorState(message: error.toString()));
    }
  }
}
