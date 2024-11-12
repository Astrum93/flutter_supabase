import 'package:flutter_supabase/presentation/home/model/user_model.dart';

abstract interface class Repository {
  Future create(UserModel userModel);

  Future<List<Map<String, dynamic>>> read(String name);

  Future update(UserModel userModel);

  Future delete(String name);
}
