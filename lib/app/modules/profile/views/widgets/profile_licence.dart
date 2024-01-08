import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileCertification extends StatelessWidget {
  ProfileCertification({required this.email});
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
                  'Licenses & Certifications',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
          if (email == controller.email)
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE_EDIT_LICENSES);
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
              stream: firestore
                  .collection('users')
                  .doc(email)
                  .collection('licences')
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = snapshot.data!.docs;
                if (snapshot.data!.docs.isEmpty) {
                  return Visibility(
                    visible: email == controller.email,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.cyan[900]!, width: 1)),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE_EDIT_LICENSES);
                          },
                          child: Text(
                            'Add your licenses here!',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.cyan[900],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final itemData = data[index].data();
                      return Container(
                        margin: EdgeInsets.only(top: 8),
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border:
                              Border.all(color: Colors.grey[300]!, width: 1),
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
                        child: ListTile(
                          title: Text(
                            itemData['title'],
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemData['company'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Text(
                                'Jan 2021 - Present',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[600],
                                    ),
                              ),
                              Visibility(
                                visible: itemData['credential'] != '',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(itemData['credential']),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              })
        ],
      ),
    );
  }
}
