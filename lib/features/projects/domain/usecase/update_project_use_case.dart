import 'package:hiasb_app/features/projects/domain/repository/project_repository.dart';

import '../entity/project_entity.dart';

class UpdateProjectUseCase {
  final ProjectRepository projectRepository;

  UpdateProjectUseCase({required this.projectRepository});

  Future<ProjectEntity> call({
    required int projectId,
    int? projectNumber,
    String? description,
    double? paidAmount,
    double? receivedAmount,
    double? walletAmount,
  }) {
    return projectRepository.updateProject(
      projectId: projectId,
      projectNumber: projectNumber,
      description: description,
      paidAmount: paidAmount,
      receivedAmount: receivedAmount,
      walletAmount: walletAmount,
    );
  }
}
