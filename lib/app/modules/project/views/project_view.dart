import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/project_model.dart';
import 'package:getx_skeleton/app/modules/project/views/widget/project_header_widget.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firestore = FirebaseFirestore.instance;
    var projectModel = ProjectModel();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProjectHeaderWidget(),
            const BannerProject(),
            Obx(
              () => StreamBuilder(
                stream: controller.searchResult.isEmpty
                    ? firestore.collection('projects').snapshots()
                    : firestore
                        .collection("projects")
                        .where("title", isGreaterThan: controller.searchResult.value)
                        .orderBy("title", descending: false)
                        .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.docs;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ProjectListing(
                          snap: data[index].data(),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No Data Found'),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
