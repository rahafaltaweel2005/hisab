import '../../../domain/entity/project_entity.dart';

abstract class GetProjectByIdState {}

class GetProjectByIdInitialState extends GetProjectByIdState {}

class GetProjectByIdLoadingState extends GetProjectByIdState {}

class GetProjectByIdLoadedState extends GetProjectByIdState {
  final ProjectEntity project;

  GetProjectByIdLoadedState({required this.project});
}

class GetProjectByIdErrorState extends GetProjectByIdState {
  final String message;

  GetProjectByIdErrorState({required this.message});
}
