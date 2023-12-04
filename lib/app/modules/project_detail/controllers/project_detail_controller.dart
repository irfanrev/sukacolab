import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;
  var username;
  var userEmail;
  var imageUrl;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = await _firestore
        .collection('users')
        .doc(prefs.getString('localUserEmail'))
        .get();
    username = userData.data()!['name'];
    userEmail = userData.data()!['email'];
    imageUrl = userData.data()!['photoUrl'];
  }

  void addBookmark(String email, String projectName) async {
    isLoading.value = true;
    await _firestore.collection('users').doc(email).update({
      'bookmarks': FieldValue.arrayUnion([projectName])
    });
    isLoading.value = false;
  }

  void joinProject(String email, String uuid, String title, String projectName,
      String location, String published) async {
    isLoading.value = true;
    await _firestore
        .collection('users')
        .doc(email)
        .collection('applications')
        .doc(uuid)
        .set(
      {
        'uuid': uuid,
        'status': 'Submited',
        'date': DateTime.now(),
        'title': title,
        'project_name': projectName,
        'location': location,
        'project_published': published,
      },
    );

    await _firestore
        .collection('projects')
        .doc(uuid)
        .collection('applications')
        .doc(email)
        .set(
      {
        'email': userEmail,
        'name': username,
        'photoUrl': imageUrl,
        'status': 'Submited',
        'date': DateTime.now(),
      },
    );
    isLoading.value = false;
  }


  
}
