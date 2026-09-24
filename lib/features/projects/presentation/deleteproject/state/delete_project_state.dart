abstract class DeleteProjectState {}

class DeleteProjectInitialState extends DeleteProjectState {}

class DeleteProjectLoadingState extends DeleteProjectState {}

class DeleteProjectSuccessState extends DeleteProjectState {}

class DeleteProjectErrorState extends DeleteProjectState {
  final String message;

  DeleteProjectErrorState({required this.message});
}
