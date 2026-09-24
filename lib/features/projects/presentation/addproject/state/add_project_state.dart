import '../../../domain/entity/project_entity.dart';

abstract class AddProjectState {}

class AddProjectInitialState extends AddProjectState {}

class AddProjectLoadingState extends AddProjectState {}

class AddProjectSuccessState extends AddProjectState {
  final ProjectEntity project;

  AddProjectSuccessState({required this.project});
}

class AddProjectErrorState extends AddProjectState {
  final String message;

  AddProjectErrorState({required this.message});
}
