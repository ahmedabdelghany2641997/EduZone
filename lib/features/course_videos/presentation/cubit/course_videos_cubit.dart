import 'package:bloc/bloc.dart';

import '../../data/repo/course_video_repo.dart';
import 'course_videos_state.dart';

class CourseVideosCubit extends Cubit<CourseVideosState> {
  final CourseVideoRepo courseVideoRepo;

  CourseVideosCubit(this.courseVideoRepo) : super(InitialCourseVideosState());

  Future<void> getCourseVideos(String courseId) async {
    emit(LoadingCourseVideosState());
    final res = await courseVideoRepo.getCourseVideos(courseId);
    res.fold(
      (error) {
        emit(ErrorCourseVideosState(error: error));
      },
      (courseVideos) {
        emit(SuccessCourseVideosState(courseVideos: courseVideos));
      },
    );
  }
}
