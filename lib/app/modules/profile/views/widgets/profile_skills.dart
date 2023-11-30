import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileSkills extends StatelessWidget {
  const ProfileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.PROFILE_EDIT_SKILL);
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.cyan[900],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              children: [
                Chip(
                  backgroundColor: Colors.cyan[600],
                  label: Text(
                    'Flutter',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.cyan[600],
                  label: Text(
                    'Android',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.cyan[600],
                  label: Text(
                    'iOS',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.cyan[600],
                  label: Text(
                    'Dart',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.cyan[600],
                  label: Text(
                    'Laravel',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.cyan[600],
                  label: Text(
                    'Flutter',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
