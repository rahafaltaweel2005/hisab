import 'package:hiasb_app/core/network/api_client.dart';
import 'package:hiasb_app/features/projects/data/datasource/project_remote_datasource.dart';
import 'package:hiasb_app/features/projects/data/models/list_projects_model.dart';
import 'package:hiasb_app/features/projects/data/models/project_model.dart';

import '../../../../core/constant/api_const.dart';

class ProjectRemoteDatasourceImpl extends ProjectRemoteDatasource {
  @override
  Future<ProjectModel> addProject({
    required int projectNumber,
    required String description,
    required double paidAmount,
    required double receivedAmount,
    required double walletAmount,
  }) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.addProject,
      data: {
        'projectNumber': projectNumber,
        'description': description,
        'paidAmount': paidAmount,
        'receivedAmount': receivedAmount,
        'walletAmount': walletAmount,
      },
    );
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<void> deleteProject({required int projectId}) async {
    await ApiClient.delete(endpoint: ApiConst.deleteProject(projectId));
  }

  @override
  Future<ProjectModel> getProjectById({required int projectId}) async {
    final response = await ApiClient.get(
      endpoint: ApiConst.getProjectById(projectId),
    );
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<ListProjectsModel> getProjects({
    required int pageNumber,
    required int pageSize,
    String? search,
  }) async {
    final response = await ApiClient.get(
      endpoint: ApiConst.getProjects,
      queryParameters: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
      },
    );
    return ListProjectsModel.fromJson(response.data);
  }

  @override
  Future<ProjectModel> updateProject({
    required int projectId,
    int? projectNumber,
    String? description,
    double? paidAmount,
    double? receivedAmount,
    double? walletAmount,
  }) async {
    final response = await ApiClient.put(
      endpoint: ApiConst.updateProject(projectId),
      data: {
        'projectNumber': projectNumber,
        'description': description,
        'paidAmount': paidAmount,
        'receivedAmount': receivedAmount,
        'walletAmount': walletAmount,
      },
    );
    return ProjectModel.fromJson(response.data);
  }
}
