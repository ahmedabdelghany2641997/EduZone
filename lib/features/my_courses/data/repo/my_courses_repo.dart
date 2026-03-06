import 'package:dartz/dartz.dart';
import 'package:eduzone/features/home/data/model/course_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo {
  final sup = Supabase.instance.client;

  Future<Either<String, List<CourseModel>>> getMycourses() async {
    try {
      final user = sup.auth.currentUser;
      if (user == null) {
        return left("User not logged in");
      }

      final response = await sup
          .from("enrollments")
          .select("courses(*)")
          .eq("user_id", user.id);

      List<CourseModel> courses = [];
      for (var item in response) {
        if (item['courses'] != null) {
          courses.add(CourseModel.fromJson(item['courses']));
        }
      }

      return right(courses);
    } catch (error) {
      return left(error.toString());
    }
  }
}
