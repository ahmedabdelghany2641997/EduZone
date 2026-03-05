import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
   final sup = Supabase.instance.client;

  Future<Either<String, void>> enrollCourse(userId, courseId) async {

    try{
      final res = await sup.from("enrollments").insert({
        "user_id": userId,
        "course_id": courseId,
      });
      return right(null);
    }catch(e){
     return left(e.toString());
    }

  }
}
