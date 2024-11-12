import 'package:flutter_supabase/domain/repository/repository.dart';
import 'package:flutter_supabase/presentation/home/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepository implements Repository {
  @override
  Future create(UserModel userModel) async {
    await Supabase.instance.client.from('user').insert([userModel.toJson()]);
  }

  @override
  Future<List<Map<String, dynamic>>> read(String name) async {
    var user;
    user = await Supabase.instance.client
        .from('user')
        .select('*')
        .eq('name', name);
    return user;
  }

  @override
  Future update(UserModel userModel) async {
    await Supabase.instance.client
        .from('user')
        .update(userModel.toJson())
        .eq('name', userModel.name)
        .select();
  }

  @override
  Future delete(String name) async {
    await Supabase.instance.client.from('user').delete().eq('name', name);
  }
}
