import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileSummary extends StatelessWidget {
  ProfileSummary({super.key});

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
                'Summary',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.PROFILE_EDIT_PROFILE);
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
          StreamBuilder(
              stream: firestore.collection('users').doc('irfan@mail.com').snapshots(),
              builder: (_, snapshot) {
                final data = snapshot.data!.data();
                if (data!['summary'] == '') {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.cyan[900]!, width: 1)
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PROFILE_EDIT_EXPERIENCE);
                        },
                        child: Text('Add your summary here!', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.cyan[900],
                        ),),
                      ),
                    ),
                  );
                }
                return Container(
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
                  child: Text(
                    data!['summary'] ?? 'No summary added yet',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              })
        ],
      ),
    );
  }
}
