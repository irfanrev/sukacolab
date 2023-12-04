import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileSkills extends StatelessWidget {
  const ProfileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.PROFILE_EDIT_SKILL);
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.cyan[900],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
              width: double.infinity,
              child: StreamBuilder(
                  stream: firestore
                      .collection('users')
                      .doc('irfan@mail.com')
                      .collection('skills')
                      .snapshots(),
                  builder: (_, snapshot) {
                    final data = snapshot.data!.docs;
                    return Wrap(
                        spacing: 8,
                        children: List.generate(
                          data.length,
                          (index) => Chip(
                            backgroundColor: Colors.cyan[600],
                            label: Text(
                              data.elementAt(index)['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ));
                  })),
        ],
      ),
    );
  }
}
