import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileSkills extends StatelessWidget {
  ProfileSkills({required this.email});
  String email;
  final ProfileController controller = Get.find();

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
          if (email == controller.email)
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
                      .doc(email)
                      .collection('skills')
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
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
