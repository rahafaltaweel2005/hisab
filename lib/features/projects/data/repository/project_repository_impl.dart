import 'package:hiasb_app/features/projects/domain/entity/project_entity.dart';
import 'package:hiasb_app/features/projects/domain/entity/project_list_entity.dart';
import 'package:hiasb_app/features/projects/domain/repository/project_repository.dart';

import '../datasource/project_remote_datasource.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectRemoteDatasource projectRemoteDatasource;

  ProjectRepositoryImpl({required this.projectRemoteDatasource});

  @override
  Future<ProjectEntity> addProject({
    required int projectNumber,
    required String description,
    required double paidAmount,
    required double receivedAmount,
    required double walletAmount,
  }) async {
    final result = await projectRemoteDatasource.addProject(
      projectNumber: projectNumber,
      description: description,
      paidAmount: paidAmount,
      receivedAmount: receivedAmount,
      walletAmount: walletAmount,
    );
    return result.toEntity();
  }

  @override
  Future<void> deleteProject({required int projectId}) async {
    await projectRemoteDatasource.deleteProject(projectId: projectId);
  }

  @override
  Future<ProjectEntity> getProjectById({required int projectId}) async {
    final result = await projectRemoteDatasource.getProjectById(
      projectId: projectId,
    );
    return result.toEntity();
  }

  @override
  Future<ProjectListEntity> getProjects({
    required int pageNumber,
    required int pageSize,
    String? search,
  }) async {
    final result = await projectRemoteDatasource.getProjects(
      pageNumber: pageNumber,
      pageSize: pageSize,
      search: search,
    );
    return result.toEntity();
  }

  @override
  Future<ProjectEntity> updateProject({
    required int projectId,
    int? projectNumber,
    String? description,
    double? paidAmount,
    double? receivedAmount,
    double? walletAmount,
  }) async {
    final result = await projectRemoteDatasource.updateProject(
      projectId: projectId,
      projectNumber: projectNumber,
      description: description,
      paidAmount: paidAmount,
      receivedAmount: receivedAmount,
      walletAmount: walletAmount,
    );
    return result.toEntity();
  }
}
