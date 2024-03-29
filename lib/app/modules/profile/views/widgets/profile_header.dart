import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({required this.email});
  String email;
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return StreamBuilder(
        stream: firestore.collection('users').doc(email.toString()).snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data!.data();
          return Container(
            width: double.infinity,
            height: 270,
            color: Colors.cyan[600],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 34,
                ),
                AvatarGlow(
                  glowRadiusFactor: 0.3,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(data!['photoUrl']!),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['name'],
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                InkWell(
                  onTap: () {
                    controller.urlEmail(data['email']);
                  },
                  child: Text(
                    data['email'],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
