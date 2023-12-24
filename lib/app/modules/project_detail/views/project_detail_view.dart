import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project_detail/views/widgets/project_detail_appbar.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../controllers/project_detail_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'],
              style: TextStyle(fontSize: 16),
            ),
            Text(
              data['project_name'],
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Obx(
            () => Visibility(
              visible: controller.isVerified.value == true,
              child: IconButton(
                onPressed: () {
                  // list of registered join project
                  final data = Get.arguments;
                  final firestore = FirebaseFirestore.instance;
                  Get.defaultDialog(
                    title: 'Project Applications',
                    content: Container(
                      width: Get.width * 0.8,
                      height: 400,
                      child: StreamBuilder(
                        stream: firestore
                            .collection('projects')
                            .doc(data['uuid'])
                            .collection('applications')
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (_, index) {
                              final itemData = snapshot.data!.docs;
                              return ListTile(
                                onTap: () => Get.toNamed(Routes.PROFILE,
                                    arguments:
                                        itemData[index]['email'].toString()),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(itemData[index]['photoUrl']),
                                ),
                                title: Text(itemData[index]['name']),
                                subtitle: Text(itemData[index]['status']),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.dashboard),
              ),
            ),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 110,
                      child: Image.network(
                        data['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          image: DecorationImage(
                            image: NetworkImage(data['imageUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.cyan[900],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            data['project_name'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '1 days ago',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.amber[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.new_releases,
                                    color: Colors.amber,
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  'Your maybe strong candidate for this project',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.black45,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                data['location'],
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse_rounded,
                                color: Colors.black45,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                data['status'],
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            child: Text(
                              'Job Description',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Text(
                              data['jobdesc'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Obx(
                      () => controller.isBookmarked.value == true
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade200,
                              ),
                              onPressed: () {
                                controller.removeBookmark(data['uuid']);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  'Unbookmark',
                                  style: TextStyle(
                                    color: Colors.deepOrange[900],
                                  ),
                                ),
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade200,
                              ),
                              onPressed: () {
                                controller.addBookmark(
                                  data['uuid'],
                                  data['jobdesc'],
                                  data['title'],
                                  data['project_name'],
                                  data['location'],
                                  data['published_at'].toString(),
                                  data['status'],
                                  data['imageUrl'],
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  'Bookmark',
                                  style: TextStyle(
                                    color: Colors.cyan[900],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan[600],
                      ),
                      onPressed: () {
                        final dataProject = Get.arguments;
                        Get.defaultDialog(
                          title: 'Join Project',
                          content: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text('Are you sure want to join this project?'),
                                const SizedBox(
                                  height: 12,
                                ),
                                Obx(
                                  () => controller.isLoading.value
                                      ? CircularProgressIndicator()
                                      : Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.amber[50],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            'All your profile data will be sent to the project owner and if you are accepted, you will be contacted by the project ownwer.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey.shade200,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 6),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Colors.cyan[900],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.cyan[600],
                                      ),
                                      onPressed: () {
                                        controller.joinProject(
                                          dataProject['uuid'],
                                          dataProject['title'],
                                          dataProject['project_name'],
                                          dataProject['location'],
                                          dataProject['published_at']
                                              .toString(),
                                        );
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 6),
                                        child: Text('Join Project'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text('Join Project'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
