import 'package:hiasb_app/features/profile/domain/repository/profile_repository.dart';

import '../../../../core/entities/user_entity.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});

  Future<UserEntity> call() async {
    return await profileRepository.getProfile();
  }
}
