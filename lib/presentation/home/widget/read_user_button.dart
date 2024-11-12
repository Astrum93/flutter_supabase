import 'package:flutter/material.dart';
import 'package:flutter_supabase/presentation/home/controller/user_controller.dart';
import 'package:get/get.dart';

class ReadUserButton extends StatelessWidget {
  const ReadUserButton({
    super.key,
    required this.userData,
  });

  final UserController userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: 200,
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
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () async {
              var name = userData.nameController.value.text;
              await userData.readUser(name);
              Get.back();
            },
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.update),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
