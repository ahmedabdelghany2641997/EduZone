import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {

  static const String url = "https://criegxpexeqlatctahso.supabase.co";
  static const String apiKey = "sb_publishable__aKwc2XxKIj8buKGyzeu8Q_cPcHkboj";

  static init()async{
    await Supabase.initialize(url: url, anonKey: apiKey);
  }
}