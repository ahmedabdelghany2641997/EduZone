import 'package:eduzone/features/home/data/model/course_model.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}
class SuccessHomeState extends HomeStates {
  final List<CourseModel>courses;
  SuccessHomeState(this.courses);
}
class ErrorHomeState extends HomeStates {
  final String error;
  ErrorHomeState(this.error);

}

