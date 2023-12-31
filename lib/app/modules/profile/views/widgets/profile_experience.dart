import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

class ProfileExperience extends StatelessWidget {
  ProfileExperience({required this.email});
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
                'Experiences',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              if (email == controller.email)
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE_EDIT_EXPERIENCE);
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
                  .collection('experiences')
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
                            Get.toNamed(Routes.PROFILE_EDIT_EXPERIENCE);
                          },
                          child: Text(
                            'Add your experience here!',
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
                      DateTime dateTime =
                          DateTime.parse(itemData['start_date']);
                      String startDate =
                          DateFormat('MMMM, yyyy').format(dateTime);
                      String endDate = itemData['end_date'];
                      if (endDate == 'Present') {
                        endDate = 'Present';
                      } else {
                        DateTime dateTime =
                            DateTime.parse(itemData['end_date']);
                        endDate = DateFormat('MMMM, yyyy').format(dateTime);
                      }
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
                          leading: Icon(
                            Icons.corporate_fare_rounded,
                            color: Colors.grey[400],
                            size: 32,
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  itemData['title'] ?? 'Developer',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Visibility(
                                visible: email == controller.email,
                                child: InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: 'Delete',
                                      middleText:
                                          'Are you sure you want to delete this experience?',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            firestore
                                                .collection('users')
                                                .doc(email)
                                                .collection('experiences')
                                                .doc(itemData['company'])
                                                .delete();
                                            Get.back();
                                            controller.update();
                                          },
                                          child: Text('Yes'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('No'),
                                        ),
                                      ],
                                    );
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red[400],
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemData['company'] ?? 'Sukacode',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Text(
                                '$startDate - $endDate',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[600],
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
