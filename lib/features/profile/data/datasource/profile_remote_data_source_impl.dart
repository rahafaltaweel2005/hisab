import 'package:hiasb_app/core/constant/api_const.dart';
import 'package:hiasb_app/core/network/api_client.dart';
import 'package:hiasb_app/features/profile/data/datasource/profile_remote_data_source.dart';

import '../models/profile_model.dart';

class ProfileRemoteDataSourceImp extends ProfileRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    final response = await ApiClient.get(endpoint: ApiConst.profile);
    return ProfileModel.fromJson(response.data);
  }
}
