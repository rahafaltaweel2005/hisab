import '../../../domain/entity/project_entity.dart';

abstract class UpdateProjectState {}

class UpdateProjectInitialState extends UpdateProjectState {}

class UpdateProjectLoadingState extends UpdateProjectState {}

class UpdateProjectSuccessState extends UpdateProjectState {
  final ProjectEntity project;

  UpdateProjectSuccessState({required this.project});
}

class UpdateProjectErrorState extends UpdateProjectState {
  final String message;

  UpdateProjectErrorState({required this.message});
}
