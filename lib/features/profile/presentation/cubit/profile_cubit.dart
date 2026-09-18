import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/profile/domain/usecase/get_profile_use_case.dart';
import 'package:hiasb_app/features/profile/presentation/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase})
    : super(ProfileInitialState());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final user = await getProfileUseCase();
      emit(ProfileLoadedState(user: user));
    } catch (error) {
      emit(ProfileErrorState(message: error.toString()));
    }
  }
}
