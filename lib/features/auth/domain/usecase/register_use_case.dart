import '../../../../core/entities/user_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<UserEntity> call({
    required String displayName,
    required String email,
    required String password,
  }){
    return authRepository.register(
      displayName: displayName,
      email: email,
      password: password,
    );
  }
}
