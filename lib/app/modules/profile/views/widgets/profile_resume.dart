import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileResume extends StatelessWidget {
  ProfileResume({required this.email});
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
                'Resume',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              if (email == controller.email)
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE_EDIT_RESUME);
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
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey[300]!, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: StreamBuilder(
                  stream: firestore.collection('users').doc(email).snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = snapshot.data!.data();
                    return ListTile(
                      title: Text(
                        data!['resume'] != ''
                            ? 'Resume.pdf'
                            : 'No Resume Added',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Default',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
          const SizedBox(
            height: 16,
          ),
          StreamBuilder(
              stream: firestore.collection('users').doc(email).snapshots(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = snapshot.data!.data();
                if (data!['resume'] == '') {
                  return Container();
                }
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.cyan[600]!, width: 1),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        controller.downloadResume(data['resume']);
                      },
                      child: Text(
                        'Show Resume',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan[600],
                            ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
