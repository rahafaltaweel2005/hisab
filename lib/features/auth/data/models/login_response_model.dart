
import '../../domain/entity/login_entity.dart';

class LoginResponseModel {
  String? accessToken;
  String? expiresAt;

  LoginResponseModel({this.accessToken, this.expiresAt});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['expiresAt'] = expiresAt;
    return data;
  }

  LoginEntity toEntity() {
    return LoginEntity(
      accessToken: accessToken!,
      expiresAt: DateTime.parse(expiresAt!),
    );
  }
}
