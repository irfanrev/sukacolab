import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project_detail/views/widgets/project_detail_appbar.dart';

import '../controllers/project_detail_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile Developer',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Sukacode Project',
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
                        'https://picsum.photos/seed/picsum/200/300',
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
                            image: NetworkImage(
                                'https://picsum.photos/seed/picsum/200/300'),
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
                            'Mobile Developer',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.cyan[900],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Sukacode Project',
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade200,
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          'Bookmark',
                          style: TextStyle(
                            color: Colors.cyan[900],
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
                      onPressed: () {},
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
