import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class ProjectHeaderWidget extends StatelessWidget {
  const ProjectHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Good Morning, Irfan',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
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
                    child: const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Start with joining project here!',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BannerProject extends StatelessWidget {
  const BannerProject({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
              Icons.work_outline_rounded,
              size: 52,
              color: Colors.white,
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
                    )),
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
    );
  }
}

class ProjectListing extends StatelessWidget {
  ProjectListing({this.snap});
  final snap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PROJECT_DETAIL, arguments: snap);
      },
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
                        icon: Icon(
                          Icons.bookmark_outline,
                          size: 32,
                          color: Colors.grey[600],
                        ))
                  ],
                )),
            SizedBox(
              width: 8,
            ),
            Text(snap['title'],
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.cyan[900],
                )),
            Text('6 days ago',
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
    );
  }
}
