import '../../../home/data/model/course_model.dart';

abstract class MyCoursesState {}

class GetMyCoursesInitialState extends MyCoursesState {}

class GetMyCoursesLoadingState extends MyCoursesState {}

class GetMyCoursesSuccessState extends MyCoursesState {
  final List<CourseModel> courses;

  GetMyCoursesSuccessState({required this.courses});
}

class GetMyCoursesErrorState extends MyCoursesState {
  final String errorMsg;

  GetMyCoursesErrorState({required this.errorMsg});
}