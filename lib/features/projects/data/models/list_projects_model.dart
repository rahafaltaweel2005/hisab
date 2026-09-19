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
        projects!.add(new Projects.fromJson(v));
      });
    }
    totals = json['totals'] != null
        ? new Totals.fromJson(json['totals'])
        : null;
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.toJson();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    return data;
  }
  ProjectListEntity toEntity() {
    return ProjectListEntity(
      pageNumber: pageNumber!,
      pageSize: pageSize!,
      totalPaidAmount: totals!.totalPaidAmount!.toDouble(),
      totalReceivedAmount: totals!.totalReceivedAmount!.toDouble(),
      totalBalance: totals!.totalBalance!.toDouble(),
      totalWalletAmount: totals!.totalWalletAmount!.toDouble(),
      totalRemainingAmount: totals!.totalRemainingAmount!.toDouble(),
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
  int? paidAmount;
  int? receivedAmount;
  int? balance;
  int? walletAmount;
  int? remainingAmount;
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
    paidAmount = json['paidAmount'];
    receivedAmount = json['receivedAmount'];
    balance = json['balance'];
    walletAmount = json['walletAmount'];
    remainingAmount = json['remainingAmount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['projectNumber'] = this.projectNumber;
    data['description'] = this.description;
    data['paidAmount'] = this.paidAmount;
    data['receivedAmount'] = this.receivedAmount;
    data['balance'] = this.balance;
    data['walletAmount'] = this.walletAmount;
    data['remainingAmount'] = this.remainingAmount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
  ProjectEntity toEntity() {
    return ProjectEntity(
      projectId: projectId!,
      projectNumber: projectNumber!,
      description: description!,
      paidAmount: paidAmount!.toDouble(),
      receivedAmount: receivedAmount!.toDouble(),
      walletAmount: walletAmount!.toDouble(),
      balance: balance!.toDouble(),
      remainingAmount: remainingAmount!.toDouble(),
      createdAt: DateTime.parse(createdAt!),
      updatedAt: DateTime.parse(updatedAt!),
    );
  }
}

class Totals {
  int? totalPaidAmount;
  int? totalReceivedAmount;
  int? totalBalance;
  int? totalWalletAmount;
  int? totalRemainingAmount;

  Totals({
    this.totalPaidAmount,
    this.totalReceivedAmount,
    this.totalBalance,
    this.totalWalletAmount,
    this.totalRemainingAmount,
  });

  Totals.fromJson(Map<String, dynamic> json) {
    totalPaidAmount = json['totalPaidAmount'];
    totalReceivedAmount = json['totalReceivedAmount'];
    totalBalance = json['totalBalance'];
    totalWalletAmount = json['totalWalletAmount'];
    totalRemainingAmount = json['totalRemainingAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPaidAmount'] = this.totalPaidAmount;
    data['totalReceivedAmount'] = this.totalReceivedAmount;
    data['totalBalance'] = this.totalBalance;
    data['totalWalletAmount'] = this.totalWalletAmount;
    data['totalRemainingAmount'] = this.totalRemainingAmount;
    return data;
  }

}
