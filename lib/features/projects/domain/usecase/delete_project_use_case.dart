import '../repository/project_repository.dart';

class DeleteProjectUseCase {
  final ProjectRepository projectRepository;

  DeleteProjectUseCase({required this.projectRepository});

  Future<void> call({required int projectId}) {
    return projectRepository.deleteProject(projectId: projectId);
  }
}
