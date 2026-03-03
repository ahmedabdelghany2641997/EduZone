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
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> signup({
    required String password,
    required String email,
    required String name,
  }) async {
    try {
      final res = await supabase.auth.signUp(password: password, email: email);
      await saveUserData(name: name, email: email);
      return right(null);
    } on AuthException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

 Future<Either<String ,void>> saveUserData({required String name ,required String email})async{

  try{
    final res = await supabase.from("users").insert({
      "id" : supabase.auth.currentUser!.id,
      "name" : name,
      "email" : email,
    });
    return right(null);
  }catch(e){
    return left(e.toString());
  }


}
}
