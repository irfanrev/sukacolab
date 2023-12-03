import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  String? title;
  String? projectName;
  String? jobdesc;
  String? status;
  Timestamp? publishedAt;
  String? location;
  String? imageUrl;

  ProjectModel({
    this.title,
    this.projectName,
    this.jobdesc,
    this.status,
    this.publishedAt,
    this.location,
    this.imageUrl,
  });

  ProjectModel.fromData(Map<String, dynamic> data) {
    title = data['title'];
    projectName = data['project_name'];
    jobdesc = data['jobdesc'];
    status = data['status'];
    publishedAt = data['published_at'];
    location = data['location'];
    imageUrl = data['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'project_name': projectName,
      'jobdesc': jobdesc,
      'status': status,
      'published_at': publishedAt,
      'location': location,
      'imageUrl': imageUrl,
    };
  }

  
}
