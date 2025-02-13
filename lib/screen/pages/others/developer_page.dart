import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/screen/widgets/developerWidgets/custom_developer_profile.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> developerList = [
      {
        'name': 'Phin Dara',
        'role': 'CEO & Founder & Developer',
        'email': 'iamraabot@gmail.com',
        'image': 'assets/raabot.jpg',
      },
      {
        'name': 'Vuthy Outhdom',
        'role': 'CTO',
        'email': 'vuthyouthdom@gmail.com',
        'image': 'assets/domz.png',
      },
      {
        'name': 'Measheanh Sengheng',
        'role': 'Mobile Developer',
        'email': 'senghengmeasheanh@gmail.com',
        'image': 'assets/sengheng.jpeg',
      },
      {
        'name': 'Savuth Yuvaneath',
        'role': 'Mobile Developer',
        'email': 'vaneathzz@gmail.com',
        'image': 'assets/vn.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('developers')),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // * Title
              Container(
                alignment: Alignment.center,
                child: Text(
                  tr('meet_the_developer'),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // * Divider
              Divider(
                color: Colors.green.shade300,
                thickness: 10,
                indent: 90,
                endIndent: 100,
              ),
              const SizedBox(height: 20),
              // * Developer Profile
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: developerList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return CustomDeveloperProfile(
                    imagePath: developerList[index]['image'],
                    developerName: developerList[index]['name'],
                    developerRole: developerList[index]['role'],
                    developerEmail: developerList[index]['email'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
