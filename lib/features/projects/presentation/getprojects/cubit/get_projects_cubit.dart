import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../domain/usecase/get_projects_use_case.dart';
import '../state/get_projects_state.dart';

class GetProjectsCubit extends Cubit<GetProjectsState> {
  final GetProjectsUseCase getProjectsUseCase;

  Timer? _debounce;

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

  void searchProjects(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getProjects(
        pageNumber: 1,
        pageSize: AppConst.defaultPageSize,
        search: query.trim().isEmpty ? null : query.trim(),
      );
    });
  }
  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
