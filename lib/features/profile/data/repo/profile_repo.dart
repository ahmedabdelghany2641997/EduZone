import 'package:dartz/dartz.dart';
import 'package:eduzone/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepo {
  final sup = Supabase.instance.client;

  Future<Either<String, ProfileModel>> getProfile() async {
    try {
      final userId = sup.auth.currentUser?.id; 
      final res = await sup.from("users").select().eq("id", userId!).single();
      return right(ProfileModel.fromJson(res));
    } catch (error) {
      return left(error.toString());
    }
  }
}
