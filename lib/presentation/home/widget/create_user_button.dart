import 'package:flutter/material.dart';
import 'package:flutter_supabase/presentation/home/controller/user_controller.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class CreateUserButton extends StatelessWidget {
  const CreateUserButton({
    super.key,
    required this.userData,
  });

  final UserController userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('이름'),
          const SizedBox(height: 10),
          TextFormField(
            style: const TextStyle(fontSize: 15),
            controller: userData.nameController.value,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4),
            ),
          ),
          const SizedBox(height: 10),
          const Text('나이'),
          const SizedBox(height: 10),
          TextFormField(
            style: const TextStyle(fontSize: 15),
            controller: userData.ageController.value,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4),
            ),
          ),
          const SizedBox(height: 10),
          const Text('설명'),
          const SizedBox(height: 10),
          TextFormField(
            style: const TextStyle(fontSize: 15),
            controller: userData.descriptionController.value,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4),
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () async {
              var user = UserModel.fromJson({
                'created_at': DateTime.now().toString(),
                'name': userData.nameController.value.text,
                'age': int.parse(userData.ageController.value.text),
                'description': userData.descriptionController.value.text,
              });
              await userData.addUser(user);
              Get.back();
            },
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.group_add_outlined),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
