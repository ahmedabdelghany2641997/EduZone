import 'package:bloc/bloc.dart';
import 'package:eduzone/features/auth/data/repo/auth_repo/auth_repo.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(LoginInitialState());

  Future<void> signin({required String password, required String email}) async {
    emit(LoginLoadingState());
    final res = await authRepo.signin(password: password, email: email);
    res.fold(
      (error) {
        emit(LoginErrorState(error: error.toString()));
      },
      (success) {
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> signup({required String password, required String email}) async {
    emit(SignupLoadingState());
    final res = await authRepo.signup(password: password, email: email);
    res.fold(
          (error) {
        emit(SignupErrorState(error: error.toString()));
      },
          (success) {
        emit(SignupSuccessState());
      },
    );
  }

}
