import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class ProfileResume extends StatelessWidget {
  const ProfileResume({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Resume',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.PROFILE_EDIT_RESUME);
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
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey[300]!, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                'CV Irfan Maulana.pdf',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Di upload pada 12 Jan 2021',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
                        ),
                  ),
                 
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Default', style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              
              border: Border.all(color: Colors.cyan[600]!, width: 1),
            ),
            child: Center(
              child: Text(
                'Download CV',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[600],
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
