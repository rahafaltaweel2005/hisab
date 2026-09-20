import '../../../domain/entity/project_list_entity.dart';

abstract class GetProjectsState {}

class GetProjectsInitialState extends GetProjectsState {}

class GetProjectsLoadingState extends GetProjectsState {}

class GetProjectsLoadedState extends GetProjectsState {
  final ProjectListEntity projects;

  GetProjectsLoadedState({required this.projects});
}

class GetProjectsErrorState extends GetProjectsState {
  final String message;
  GetProjectsErrorState({required this.message});
}
