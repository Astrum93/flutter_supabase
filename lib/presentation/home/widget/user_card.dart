import 'package:flutter/material.dart';
import 'package:flutter_supabase/presentation/home/controller/user_controller.dart';
import 'package:flutter_supabase/presentation/home/widget/user_id_card.dart';
import 'package:get/get.dart';

class UserCard extends GetView<UserController> {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.userList.isEmpty
          ? const Center(
              child: Text('No Data'),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 108),
              child: ListView.builder(
                itemCount: controller.userList.length,
                itemBuilder: (context, index) {
                  var user = controller.userList[index];
                  var id = user['id'].toString();
                  var created_at =
                      user['created_at'].toString().substring(0, 10);
                  var name = user['name'];
                  var age = user['age'].toString();
                  var description = user['description'];
                  return Column(
                    children: [
                      UserIdCard(
                          id: id,
                          created_at: created_at,
                          name: name,
                          age: age,
                          description: description),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
