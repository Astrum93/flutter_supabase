import 'package:flutter/material.dart';

class UserIdCard extends StatelessWidget {
  const UserIdCard({
    super.key,
    required this.id,
    required this.created_at,
    required this.name,
    required this.age,
    required this.description,
  });

  final String id;
  final String created_at;
  final dynamic name;
  final String age;
  final dynamic description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.co_present_outlined, size: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$id번',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(created_at),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name / $age세',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          Text(description),
        ],
      ),
    );
  }
}
