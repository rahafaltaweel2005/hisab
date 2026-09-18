import 'package:hiasb_app/core/entities/user_entity.dart';

abstract class ProfileRepository {

  Future<UserEntity> getProfile();

}
