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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: const Text('Bookmarks'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Bookmarks',
              ),
              Tab(
                text: 'My Projects',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // SizedBox.expand(
            //   child: StreamBuilder(
            //     stream: firestore
            //         .collection('users')
            //         .doc(controller.email)
            //         .collection('bookmarks')
            //         .snapshots(),
            //     builder: (_, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       if (snapshot.data!.docs.isEmpty) {
            //         return Center(
            //           child: Text('No Bookmark Found'),
            //         );
            //       }
            //       return ListView.builder(
            //         itemCount: snapshot.data!.docs.length,
            //         itemBuilder: (context, index) {
            //           final data = snapshot.data!.docs[index];
            //           return ProjectListing(
            //             snap: data.data(),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            Text('page 1'),
            Text('page 2')
          ],
        ),
      ),
    );
  }
}
