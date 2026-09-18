import 'package:hiasb_app/core/entities/user_entity.dart';
import 'package:hiasb_app/features/profile/domain/repository/profile_repository.dart';

import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImp({required this.profileRemoteDataSource});


  @override
  Future<UserEntity> getProfile() async {
    final result = await profileRemoteDataSource.getProfile();
    return result.toEntity();
  }
}
