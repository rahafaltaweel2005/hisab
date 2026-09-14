
import '../../../../core/entities/user_entity.dart';

class RegisterResponseModel {
  String? id;
  String? displayName;
  String? email;

  RegisterResponseModel({this.id, this.displayName, this.email});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['displayName'] = displayName;
    data['email'] = email;
    return data;
  }

  UserEntity toEntity() {
    return UserEntity(id: id!, displayName: displayName!, email: email!);
  }
}
