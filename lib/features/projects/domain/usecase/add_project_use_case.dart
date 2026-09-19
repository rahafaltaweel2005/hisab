import 'package:hiasb_app/features/projects/domain/entity/project_entity.dart';
import 'package:hiasb_app/features/projects/domain/repository/project_repository.dart';

class AddProjectUseCase {
  final ProjectRepository projectRepository;

  AddProjectUseCase({required this.projectRepository});

  Future<ProjectEntity> call({
    required int projectNumber,
    required String description,
    required double paidAmount,
    required double receivedAmount,
    required double walletAmount,
  }) {
    return projectRepository.addProject(
      projectNumber: projectNumber,
      description: description,
      paidAmount: paidAmount,
      receivedAmount: receivedAmount,
      walletAmount: walletAmount,
    );
  }
}
