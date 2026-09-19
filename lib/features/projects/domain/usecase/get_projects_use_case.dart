import 'package:hiasb_app/features/projects/domain/repository/project_repository.dart';

import '../entity/project_list_entity.dart';

class GetProjectsUseCase {
  final ProjectRepository projectRepository;

  GetProjectsUseCase({required this.projectRepository});

  Future<ProjectListEntity> call({
    required int pageNumber,
    required int pageSize,
    String? search,
  }) {
    return projectRepository.getProjects(
      pageNumber: pageNumber,
      pageSize: pageSize,
      search: search,
    );
  }
}
