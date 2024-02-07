import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project/controllers/project_controller.dart';
import 'package:intl/intl.dart';

import '../../../../routes/app_pages.dart';

class ProjectHeaderWidget extends StatelessWidget {
  const ProjectHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firestore = FirebaseFirestore.instance;
    return GetBuilder<ProjectController>(
        init: ProjectController(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: 180,
            color: Colors.cyan[600],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(
                    () => StreamBuilder(
                        stream: firestore
                            .collection('users')
                            .doc(controller.email.value)
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data!.data() != null) {
                            final data = snapshot.data!.data()!;
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.PROFILE,
                                        arguments: data['email']);
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        data['photoUrl'] as String),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    'Hey, ${data['name']}',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.ADD_PROJECT);
                                  },
                                  icon: Icon(
                                    Icons.add_box_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ).animate().fade().slide();
                          } else {
                            return SizedBox();
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Expanded(
                            child: Center(
                              child: TextField(
                                controller: controller.search,
                                decoration: const InputDecoration(
                                  hintText: 'Search based on title',
                                  border: InputBorder.none,
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.search,
                                onSubmitted: (value) {
                                  controller.searchProject();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () => controller.searchProject(),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.amber),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class BannerProject extends StatelessWidget {
  const BannerProject({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PURPOSE_PROJECT);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                EvaIcons.bulbOutline,
                size: 52,
                color: Colors.amber,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have a project and need help?',
                          style: theme.textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                          ))
                      .animate()
                      .fade(
                        duration: Duration(milliseconds: 700),
                      )
                      .slide(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.amber,
                    ),
                    child: Text(
                      'Contact us now!',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectListing extends StatelessWidget {
  ProjectListing({this.snap});
  final snap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //timestamp to String
    // final publishedAt = DateTime.parse(snap['published_at'].toDate().toString())
    //     .toString()
    //     .substring(0, 10);

// ...

    final publishedAt = snap['published_at'].toDate();
    final formattedDate =
        DateFormat.yMMMMd().format(publishedAt); // Format: October 1, 2023

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PROJECT_DETAIL, arguments: snap);
      },
      child: Animate(
        effects: [
          SlideEffect(
            duration: Duration(milliseconds: 400),
          ),
          FadeEffect(),
        ],
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 15,
                  offset: Offset.zero,
                ),
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 15,
                  offset: Offset.zero,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(snap['imageUrl']),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: (snap['isVerified'] == true)
                            ? Icon(
                                Icons.verified,
                                color: Colors.cyan[600],
                              )
                            : Icon(
                                Icons.people,
                                color: Colors.grey.shade400,
                              ),
                      ),
                    ],
                  )),
              SizedBox(
                width: 8,
              ),
              Text(snap['title'],
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.cyan[900],
                  )),
              Text(formattedDate,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  )),
              const SizedBox(
                height: 12,
              ),
              Text(
                snap['location'],
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectContent extends StatelessWidget {
  const ProjectContent({super.key});
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return GetBuilder<ProjectController>(
        init: ProjectController(),
        builder: (controller) {
          return StreamBuilder(
            stream: firestore
                .collection("projects")
                .orderBy("published_at", descending: true)
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
          );
        });
  }
}

class ProjectSearch extends StatelessWidget {
  const ProjectSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProjectController>();
    final firestore = FirebaseFirestore.instance;
    var searchResult = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        centerTitle: true,
        title: Text('Search Result'),
      ),
      body: SizedBox.expand(
        child: StreamBuilder(
          stream: firestore
              .collection('projects')
              .where('title', isGreaterThanOrEqualTo: searchResult)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final data = snapshot.data!.docs;
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (data.isEmpty) {
                    return Center(
                      child: Text('No Data Found'),
                    );
                  }
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
    );
  }
}
