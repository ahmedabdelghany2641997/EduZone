import 'package:bloc/bloc.dart';

import '../../data/repo/my_courses_repo.dart';
import 'my_courses_states.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo myCoursesRepo;

  MyCoursesCubit(this.myCoursesRepo) : super(GetMyCoursesInitialState());

  Future<void> getMyCourses() async {
    emit(GetMyCoursesLoadingState());

    final res = await myCoursesRepo.getMycourses();

    res.fold(
          (error) {
        emit(GetMyCoursesErrorState(errorMsg: error));
      },
          (courses) {
        emit(GetMyCoursesSuccessState(courses: courses));
      },
    );
  }
}