import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  SupabaseClient supabase = Supabase.instance.client;

  Future<Either<String, void>> signin({
    required String password,
    required String email,
  }) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return right(null);
    } on AuthException catch (e) {
      return left(e.toString());
    }

    catch (e) {
      return left(e.toString());
    }
  }


  Future<Either<String, void>> signup({
    required String password,
    required String email,
  }) async {
    try {
      final res = await supabase.auth.signUp(
        password: password,
        email: email,



      );
      return right(null);
    } on AuthException catch (e) {
      return left(e.toString());
    }

    catch (e) {
      return left(e.toString());
    }
  }
}
