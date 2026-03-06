import 'package:eduzone/features/course_videos/data/model/course_video_model.dart';

abstract class CourseVideosState {}

class InitialCourseVideosState extends CourseVideosState {}

class LoadingCourseVideosState extends CourseVideosState {}

class SuccessCourseVideosState extends CourseVideosState {
  final List<CourseVideoModel> courseVideos;

  SuccessCourseVideosState({required this.courseVideos});
}

class ErrorCourseVideosState extends CourseVideosState {
  final String error;

  ErrorCourseVideosState({required this.error});
}
