import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectDetailAppbar extends StatelessWidget {
  ProjectDetailAppbar({required this.jobTitle, required this.projectName});
  String jobTitle;
  String projectName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.cyan[600],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobTitle,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              projectName,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined),
          )
        ],
      );
  }
}