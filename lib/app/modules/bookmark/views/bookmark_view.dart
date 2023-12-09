import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project/views/widget/project_header_widget.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: const Text('Bookmark'),
          centerTitle: true,
        ),
        body: GetBuilder<BookmarkController>(
            init: BookmarkController(),
            builder: (controller) {
              return StreamBuilder(
                stream: firestore
                    .collection('users')
                    .doc(controller.email)
                    .collection('bookmarks')
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.docs[index];
                      return ProjectListing(
                        snap: data.data(),
                      );
                    },
                  );
                },
              );
            }));
  }
}
