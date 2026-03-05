abstract class EnrollState {}

class EnrollInitialState extends EnrollState {}

class EnrollLoadingState extends EnrollState {}

class EnrollSuccessState extends EnrollState {}

class EnrollFailureState extends EnrollState {
  final String error;
  EnrollFailureState(this.error);
}