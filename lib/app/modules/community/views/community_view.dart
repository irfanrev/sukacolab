import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: const Text('Application Status'),
          centerTitle: true,
        ),
        body: GetBuilder<CommunityController>(
            init: CommunityController(),
            builder: (controller) {
              return StreamBuilder(
                  stream: firestore
                      .collection('users')
                      .doc(controller.email)
                      .collection('applications')
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('No Application Found'),
                      );
                    }
                    final data = snapshot.data!.docs;
                    return ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              data[index].data()['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(data[index].data()['project_name']),
                            trailing: Text(
                              data[index].data()['status'],
                              style: TextStyle(
                                color: data[index].data()['status'] ==
                                        'Accepted'
                                    ? Colors.green
                                    : data[index].data()['status'] == 'Rejected'
                                        ? Colors.red
                                        : data[index].data()['status'] ==
                                                'Submited'
                                            ? Colors.cyan
                                            : Colors.amber,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  });
            }));
  }
}
