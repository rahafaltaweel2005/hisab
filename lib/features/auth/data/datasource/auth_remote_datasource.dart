

import '../model/login_response_model.dart';
import '../model/register_response_model.dart';

abstract class AuthRemoteDatasource {

  Future<RegisterResponseModel> register({
    required String displayName,
    required String email,
    required String password,
  });

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  }
