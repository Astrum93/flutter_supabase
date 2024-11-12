import 'package:flutter/cupertino.dart';
import 'package:flutter_supabase/domain/usecase/usecase.dart';
import 'package:flutter_supabase/presentation/home/model/user_model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract mixin class UserDataProvider {
  late final userData = Get.find<UserController>();
}

class UserController extends GetxController {
  RxList userList = [].obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;

  @override
  void onInit() {
    initialUserList();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.value.dispose();
    ageController.value.dispose();
    descriptionController.value.dispose();
    super.dispose();
  }

  Future initialUserList() async {
    userList.value = await Supabase.instance.client.from('user').select();
  }

  Future addUser(UserModel userModel) async {
    await CreateUseCase().execute(userModel);
    userList.value = await Supabase.instance.client.from('user').select();
  }

  Future readUser(String name) async {
    userList.value = await ReadUseCase().execute(name);
  }

  Future updateUser(UserModel userModel) async {
    await UpdateUseCase().execute(userModel);
    userList.value = await Supabase.instance.client.from('user').select();
  }

  Future deleteUser(String name) async {
    await DeleteUseCase().execute(name);
    userList.value = await Supabase.instance.client.from('user').select();
  }
}
