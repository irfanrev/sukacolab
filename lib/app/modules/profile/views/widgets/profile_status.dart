import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';

class ProfileStatus extends StatelessWidget {
  ProfileStatus({required this.email});
  String email;
  final ProfileController controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan[600]!, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            'Application Status',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (email != controller.email)
          Expanded(
            child: StreamBuilder(
                stream: firestore
                    .collection('users')
                    .doc(email.toString())
                    .collection('applications')
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: () {
                            final firestore = FirebaseFirestore.instance;
                            final data = snapshot.data!.docs[index];
                            final itemEmail = email;
                            Get.defaultDialog(
                              title: 'Update Status',
                              content: Column(
                                children: [
                                  Text(
                                      'Update status for ${data['project_name']}'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      labelText: 'Status',
                                    ),
                                    onChanged: (value) async {
                                      await firestore
                                          .collection('users')
                                          .doc(itemEmail.toString())
                                          .collection('applications')
                                          .doc(data['uuid'])
                                          .update({
                                        'status': value,
                                      });
                                      Get.back();
                                    },
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Reviewing'),
                                        value: 'Reviewing',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Accepted'),
                                        value: 'Accepted',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Rejected'),
                                        value: 'Rejected',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          title: Text(data[index]['project_name']),
                          subtitle: Text(data[index]['title']),
                          trailing: Text(
                            data[index]['status'],
                            style: TextStyle(
                              color: data[index]['status'] == 'Accepted'
                                  ? Colors.green
                                  : data[index]['status'] == 'Rejected'
                                      ? Colors.red
                                      : Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
