import 'package:hiasb_app/features/projects/data/models/list_projects_model.dart';

import '../models/project_model.dart';

abstract class ProjectRemoteDatasource {
  Future<ListProjectsModel> getProjects({
    required int pageNumber,
    required int pageSize,
    String? search,
});

  Future<ProjectModel> addProject({
    required int projectNumber,
    required String description,
    required double paidAmount,
    required double receivedAmount,
    required double walletAmount,
  });

  Future<ProjectModel> updateProject({
    required int projectId,
    int? projectNumber,
    String? description,
    double? paidAmount,
    double? receivedAmount,
    double? walletAmount,
  });

  Future<ProjectModel> getProjectById({required int projectId});

  Future<void> deleteProject({required int projectId});
}
