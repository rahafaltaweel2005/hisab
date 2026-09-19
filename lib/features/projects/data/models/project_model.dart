import '../../domain/entity/project_entity.dart';

class ProjectModel {
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

  ProjectModel({
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

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectNumber = json['projectNumber'];
    description = json['description'];
    paidAmount = (json['paidAmount'] as num?)?.toDouble();
    receivedAmount = (json['receivedAmount'] as num?)?.toDouble();
    balance = (json['balance'] as num?)?.toDouble();
    walletAmount = (json['walletAmount'] as num?)?.toDouble();
    remainingAmount = (json['remainingAmount'] as num?)?.toDouble();
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