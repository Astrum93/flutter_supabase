import 'package:flutter/material.dart';
import 'package:flutter_supabase/presentation/home/controller/user_controller.dart';
import 'package:flutter_supabase/presentation/home/widget/delete_user_button.dart';
import 'package:flutter_supabase/presentation/home/widget/read_user_button.dart';
import 'package:flutter_supabase/presentation/home/widget/update_user_button.dart';
import 'package:flutter_supabase/presentation/home/widget/user_card.dart';
import 'package:get/get.dart';

import 'widget/create_user_button.dart';
import 'widget/fade_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with UserDataProvider {
  bool _show = false;
  bool _show2 = false;
  bool _show3 = false;
  bool _show4 = false;

  @override
  void initState() {
    Get.put(UserController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<UserController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          UserCard(),
          FadeButton(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  userData.nameController.value.clear();
                  userData.ageController.value.clear();
                  userData.descriptionController.value.clear();
                  return CreateUserButton(userData: userData);
                },
              );
            },
            left: 16,
            flag: _show,
            color: Colors.greenAccent,
            icon: Icons.group_add_outlined,
          ),
          FadeButton(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  userData.nameController.value.clear();
                  userData.ageController.value.clear();
                  userData.descriptionController.value.clear();
                  return ReadUserButton(userData: userData);
                },
              );
            },
            left: 82,
            flag: _show2,
            color: Colors.blueAccent,
            icon: Icons.update,
          ),
          FadeButton(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  userData.nameController.value.clear();
                  userData.ageController.value.clear();
                  userData.descriptionController.value.clear();
                  return UpdateUserButton(userData: userData);
                },
              );
            },
            left: 148,
            flag: _show3,
            color: Colors.yellowAccent,
            icon: Icons.mode_edit_outline_outlined,
          ),
          FadeButton(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  userData.nameController.value.clear();
                  userData.ageController.value.clear();
                  userData.descriptionController.value.clear();
                  return DeleteUserButton(userData: userData);
                },
              );
            },
            left: 214,
            flag: _show4,
            color: Colors.redAccent,
            icon: Icons.group_remove_outlined,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _show = !_show;
          });
          await Future.delayed(const Duration(milliseconds: 200));
          setState(() {
            _show2 = !_show2;
          });
          await Future.delayed(const Duration(milliseconds: 200));
          setState(() {
            _show3 = !_show3;
          });
          await Future.delayed(const Duration(milliseconds: 200));
          setState(() {
            _show4 = !_show4;
          });
        },
        child: Icon(_show || _show2 || _show3 || _show4
            ? Icons.arrow_left
            : Icons.arrow_drop_up),
      ),
    );
  }
}
