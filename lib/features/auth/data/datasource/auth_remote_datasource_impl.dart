import 'package:hiasb_app/core/constant/api_const.dart';
import 'package:hiasb_app/core/constant/app_const.dart';
import 'package:hiasb_app/core/network/api_client.dart';
import 'package:hiasb_app/core/storage/secure_storage_helper.dart';
import '../model/login_response_model.dart';
import '../model/register_response_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImp extends AuthRemoteDatasource {
  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.login,
      data: {'email': email, 'password': password},
    );
    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    try {
      await ApiClient.post(endpoint: ApiConst.logout);
    } finally {
      await SecureStorageHelper.delete(key: AppConst.accessTokenKey);
    }
  }

  @override
  Future<RegisterResponseModel> register({
    required String displayName,
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.register,
      data: {'displayName': displayName, 'email': email, 'password': password},
    );
    return RegisterResponseModel.fromJson(response.data);
  }
}
