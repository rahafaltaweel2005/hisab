class LoginEntity {
  final String accessToken;
  final DateTime expiresAt;

  LoginEntity({required this.accessToken, required this.expiresAt});
}