import '../entity/project_entity.dart';
import '../entity/project_list_entity.dart';

abstract class ProjectRepository {
  Future<ProjectListEntity>getProjects({
    required int pageNumber,
    required int pageSize,
    String? search,


  });

  Future<ProjectEntity> addProject({
    required int projectNumber,
    required String description,
    required double paidAmount,
    required double receivedAmount,
    required double walletAmount,
  });

  Future<ProjectEntity> updateProject({
    required int projectId,
    int? projectNumber,
    String? description,
    double? paidAmount,
    double? receivedAmount,
    double? walletAmount,
  });

  Future<void> deleteProject({required int projectId});

  Future<ProjectEntity> getProjectById({required int projectId});
}
