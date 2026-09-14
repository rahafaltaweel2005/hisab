
import '../../../../core/entities/user_entity.dart';
import '../entity/login_entity.dart';

abstract class AuthRepository {

  Future<UserEntity> register({
    required String displayName,
    required String email,
    required String password,
  });

  Future<LoginEntity> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
