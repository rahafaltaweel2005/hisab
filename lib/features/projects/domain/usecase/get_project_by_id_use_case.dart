import 'package:hiasb_app/features/projects/domain/repository/project_repository.dart';

import '../entity/project_entity.dart';

class GetProjectByIdUseCase {
  final ProjectRepository projectRepository;

  GetProjectByIdUseCase({required this.projectRepository});

  Future<ProjectEntity> call({required int projectId}) {
    return projectRepository.getProjectById(projectId: projectId);
  }
}
