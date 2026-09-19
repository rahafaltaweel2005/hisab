class ProjectEntity {
  final int projectId;
  final int projectNumber;
  final String description;
  final double paidAmount;
  final double receivedAmount;
  final double walletAmount;
  final double balance;
  final double remainingAmount;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProjectEntity({
    required this.projectId,
    required this.projectNumber,
    required this.description,
    required this.paidAmount,
    required this.receivedAmount,
    required this.walletAmount,
    required this.balance,
    required this.remainingAmount,
    required this.createdAt,
    required this.updatedAt,
  });
}
