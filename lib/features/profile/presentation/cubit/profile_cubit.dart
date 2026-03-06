import 'package:bloc/bloc.dart';
import 'package:eduzone/features/profile/presentation/cubit/profile_state.dart';

import '../../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final res = await profileRepo.getProfile();
    res.fold(
      (error) {
        emit(ProfileError(message: error));
      },
      (profileData) {
        emit(ProfileSuccess(profileModel: profileData));
      },
    );
  }
}
