import '../entity/login_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<LoginEntity> call({required String email, required String password}) {
    return authRepository.login(email: email, password: password);
  }
}
