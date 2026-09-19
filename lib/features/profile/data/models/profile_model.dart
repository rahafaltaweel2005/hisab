import '../../../../core/entities/user_entity.dart';

class ProfileModel {
  String? id;
  String? displayName;
  String? email;

  ProfileModel({this.id, this.displayName, this.email});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    return data;
  }

  UserEntity toEntity() {
    return UserEntity(id: id!, displayName: displayName!, email: email!);
  }
}
