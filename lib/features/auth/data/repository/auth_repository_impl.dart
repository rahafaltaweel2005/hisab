import 'package:hiasb_app/core/entities/user_entity.dart';
import 'package:hiasb_app/features/auth/domain/entity/login_entity.dart';
import 'package:hiasb_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/constant/app_const.dart';
import '../../../../core/storage/secure_storage_helper.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    final model = await authRemoteDatasource.login(
      email: email,
      password: password,
    );
    await SecureStorageHelper.write(
      key: AppConst.accessTokenKey,
      value: model.accessToken.toString(),
    );

    return model.toEntity();
  }

  @override
  Future<void> logout() async {
    await authRemoteDatasource.logout();
  }

  @override
  Future<UserEntity> register({
    required String displayName,
    required String email,
    required String password,
  }) async {
    final model = await authRemoteDatasource.register(
      displayName: displayName,
      email: email,
      password: password,
    );
    return model.toEntity();
  }
}
