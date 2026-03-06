import 'package:dartz/dartz.dart';
import 'package:eduzone/features/course_videos/data/model/course_video_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseVideoRepo {
  final sup = Supabase.instance.client;

  Future<Either<String, List<CourseVideoModel>>> getCourseVideos(
    String courseId,
  ) async {
    try {
      final res = await sup.from("videos").select().eq("course_id", courseId);
      List<CourseVideoModel> courseVideos = [];
      for (var cousre in res) {
        courseVideos.add(CourseVideoModel.fromJson(cousre));
      }
      return right(courseVideos);
    } catch (error) {
      return left(error.toString());
    }
  }
}
