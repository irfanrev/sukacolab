import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../controllers/purpose_project_controller.dart';

class PurposeProjectView extends GetView<PurposeProjectController> {
  const PurposeProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Purpose Project'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Need help',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              )
                  .animate()
                  .fade(
                    duration: Duration(milliseconds: 1000),
                  )
                  .slide(
                    duration: Duration(milliseconds: 700),
                  ),
              Text(
                'completing your',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              )
                  .animate()
                  .fade(
                    delay: Duration(milliseconds: 600),
                    duration: Duration(milliseconds: 1000),
                  )
                  .slide(
                    duration: Duration(milliseconds: 700),
                  ),
              Text(
                'Project?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              )
                  .animate()
                  .fade(
                    delay: Duration(milliseconds: 1200),
                    duration: Duration(milliseconds: 1000),
                  )
                  .slide(
                    duration: Duration(milliseconds: 700),
                  ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
              )
                  .animate()
                  .fade(
                    delay: Duration(milliseconds: 1800),
                    duration: Duration(milliseconds: 1000),
                  )
                  .slide(
                    duration: Duration(milliseconds: 700),
                  ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact us now!',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      controller.perfomeWhatsApp();
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal[600],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Whatsapp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      controller.perfomeEmail();
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange[600],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'sukacode.dev@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      controller.perfomeDiscord();
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple[900],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_alt,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Discord Community',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fade(
                    delay: Duration(milliseconds: 3000),
                    duration: Duration(milliseconds: 1000),
                  )
                  .slide(
                    duration: Duration(milliseconds: 700),
                  ),
            ],
          ),
        ));
  }
}
