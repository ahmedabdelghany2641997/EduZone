import 'package:bloc/bloc.dart';
import '../../data/repo/course_details_repo.dart';
import 'course_details_states.dart';

class CourseDetailsCubit extends Cubit<EnrollState> {
  final CourseDetailsRepo courseDetailsRepo;

  CourseDetailsCubit(this.courseDetailsRepo) : super(EnrollInitialState());

  Future<void> enrollCourse({userId, courseId}) async {
    final res = await courseDetailsRepo.enrollCourse(userId, courseId);
    res.fold(
      (error) {
        emit(EnrollFailureState(error));
      },
      (success) {
        emit(EnrollSuccessState());
      },
    );
  }
}
