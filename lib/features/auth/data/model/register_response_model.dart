
import '../../../../core/entities/user_entity.dart';

class RegisterResponseModel {
  String? accessToken;
  String? expiresAt;
  String? id;
  String? displayName;
  String? email;

  RegisterResponseModel({
    this.accessToken,
    this.expiresAt,
    this.id,
    this.displayName,
    this.email,
  });

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresAt = json['expiresAt'];
    final user = json['user'] as Map<String, dynamic>?;
    id = user?['id'];
    displayName = user?['displayName'];
    email = user?['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['expiresAt'] = expiresAt;
    data['user'] = {'id': id, 'displayName': displayName, 'email': email};
    return data;
  }

  UserEntity toEntity() {
    return UserEntity(id: id!, displayName: displayName!, email: email!);
  }
}
