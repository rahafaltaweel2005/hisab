import 'package:hiasb_app/features/projects/domain/entity/project_entity.dart';

class ProjectListEntity {
  final int pageNumber;
  final int pageSize;
  final double totalPaidAmount;
  final double totalReceivedAmount;
  final double totalBalance;
  final double totalWalletAmount;
  final double totalRemainingAmount;
  final int totalCount;
  final int totalPages;
  final List<ProjectEntity> projects;

  ProjectListEntity({
    required this.pageNumber,
    required this.pageSize,
    required this.totalPaidAmount,
    required this.totalReceivedAmount,
    required this.totalBalance,
    required this.totalWalletAmount,
    required this.totalRemainingAmount,
    required this.totalCount,
    required this.totalPages,
    required this.projects,
  });
}
