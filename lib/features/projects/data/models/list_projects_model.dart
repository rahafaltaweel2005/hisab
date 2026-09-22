import '../../domain/entity/project_entity.dart';
import '../../domain/entity/project_list_entity.dart';

class ListProjectsModel {
  List<Projects>? projects;
  Totals? totals;
  int? pageNumber;
  int? pageSize;
  int? totalCount;
  int? totalPages;

  ListProjectsModel({
    this.projects,
    this.totals,
    this.pageNumber,
    this.pageSize,
    this.totalCount,
    this.totalPages,
  });

  ListProjectsModel.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];

      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
      });
    }

    totals = json['totals'] != null
        ? Totals.fromJson(json['totals'])
        : null;

    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (projects != null) {
      data['projects'] =
          projects!.map((v) => v.toJson()).toList();
    }

    if (totals != null) {
      data['totals'] = totals!.toJson();
    }

    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['totalCount'] = totalCount;
    data['totalPages'] = totalPages;

    return data;
  }

  ProjectListEntity toEntity() {
    return ProjectListEntity(
      pageNumber: pageNumber!,
      pageSize: pageSize!,
      totalPaidAmount: totals!.totalPaidAmount!,
      totalReceivedAmount: totals!.totalReceivedAmount!,
      totalBalance: totals!.totalBalance!,
      totalWalletAmount: totals!.totalWalletAmount!,
      totalRemainingAmount: totals!.totalRemainingAmount!,
      totalCount: totalCount!,
      totalPages: totalPages!,
      projects: projects!.map((e) => e.toEntity()).toList(),
    );
  }
}

class Projects {
  int? projectId;
  int? projectNumber;
  String? description;

  double? paidAmount;
  double? receivedAmount;
  double? balance;
  double? walletAmount;
  double? remainingAmount;

  String? createdAt;
  String? updatedAt;

  Projects({
    this.projectId,
    this.projectNumber,
    this.description,
    this.paidAmount,
    this.receivedAmount,
    this.balance,
    this.walletAmount,
    this.remainingAmount,
    this.createdAt,
    this.updatedAt,
  });

  Projects.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectNumber = json['projectNumber'];
    description = json['description'];

    paidAmount = (json['paidAmount'] as num?)?.toDouble();
    receivedAmount = (json['receivedAmount'] as num?)?.toDouble();
    balance = (json['balance'] as num?)?.toDouble();
    walletAmount = (json['walletAmount'] as num?)?.toDouble();
    remainingAmount =
        (json['remainingAmount'] as num?)?.toDouble();

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['projectId'] = projectId;
    data['projectNumber'] = projectNumber;
    data['description'] = description;
    data['paidAmount'] = paidAmount;
    data['receivedAmount'] = receivedAmount;
    data['balance'] = balance;
    data['walletAmount'] = walletAmount;
    data['remainingAmount'] = remainingAmount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }

  ProjectEntity toEntity() {
    return ProjectEntity(
      projectId: projectId!,
      projectNumber: projectNumber!,
      description: description!,
      paidAmount: paidAmount!,
      receivedAmount: receivedAmount!,
      walletAmount: walletAmount!,
      balance: balance!,
      remainingAmount: remainingAmount!,
      createdAt: DateTime.parse(createdAt!),
      updatedAt: DateTime.parse(updatedAt!),
    );
  }
}

class Totals {
  double? totalPaidAmount;
  double? totalReceivedAmount;
  double? totalBalance;
  double? totalWalletAmount;
  double? totalRemainingAmount;

  Totals({
    this.totalPaidAmount,
    this.totalReceivedAmount,
    this.totalBalance,
    this.totalWalletAmount,
    this.totalRemainingAmount,
  });

  Totals.fromJson(Map<String, dynamic> json) {
    totalPaidAmount =
        (json['totalPaidAmount'] as num?)?.toDouble();

    totalReceivedAmount =
        (json['totalReceivedAmount'] as num?)?.toDouble();

    totalBalance =
        (json['totalBalance'] as num?)?.toDouble();

    totalWalletAmount =
        (json['totalWalletAmount'] as num?)?.toDouble();

    totalRemainingAmount =
        (json['totalRemainingAmount'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['totalPaidAmount'] = totalPaidAmount;
    data['totalReceivedAmount'] = totalReceivedAmount;
    data['totalBalance'] = totalBalance;
    data['totalWalletAmount'] = totalWalletAmount;
    data['totalRemainingAmount'] = totalRemainingAmount;

    return data;
  }
}