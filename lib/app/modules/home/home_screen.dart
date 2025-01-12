import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooltask/app/core/app_asset.dart';
import 'package:schooltask/app/core/app_string.dart';
import 'package:schooltask/app/core/app_style.dart';
import 'package:schooltask/app/widgets/categorie_containers.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.welcome,
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications_none_sharp,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 15),
            _buildDailyActivitiesSection(),
            const SizedBox(height: 5),
            _buildUpcomingEventsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      height: Get.height / 5.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppAsset.boyimage),
              radius: Get.width / 7,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userName, style: headLine4),
                Text(AppString.asection, style: headLine5),
                Text(AppString.rollNo, style: headLine5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyActivitiesSection() {
    return Container(
      height: Get.height / 3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.dailyActivities, style: headLine6),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategorieContainers(
                    icon: Icons.school_outlined, title: AppString.academic),
                CategorieContainers(
                    icon: Icons.event_note_sharp, title: AppString.exams),
                CategorieContainers(
                    icon: Icons.fact_check_outlined,
                    title: AppString.attendance),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategorieContainers(
                    icon: Icons.calendar_month_outlined,
                    title: AppString.timeTable),
                CategorieContainers(
                    icon: Icons.sticky_note_2_sharp, title: AppString.reports),
                CategorieContainers(
                    icon: Icons.receipt_long_outlined, title: AppString.fees),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEventsSection() {
    final upcomingEvents = [
      {
        'title': AppString.sportsDay,
        'date': AppString.date,
        'content': AppString.content,
        'image': AppAsset.sports,
      },
      {
        'title': AppString.sportsDay,
        'date': AppString.date,
        'content': AppString.content,
        'image': AppAsset.sports,
      },
      {
        'title': AppString.sportsDay,
        'date': AppString.date,
        'content': AppString.content,
        'image': AppAsset.sports,
      },
    ];

    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(AppString.upcomingEvents, style: headLine4),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: upcomingEvents.length,
                  itemBuilder: (context, index) {
                    final event = upcomingEvents[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        height: Get.height / 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event['title']!,
                                style: headLine5.copyWith(color: primaryColor),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(event['image']!),
                                    radius: Get.width / 12,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event['date']!,
                                        style: headLine5.copyWith(
                                            color: primaryColor),
                                      ),
                                      SizedBox(
                                        width: Get.width / 2,
                                        child: Text(
                                          event['content']!,
                                          style: const TextStyle(
                                              fontSize: 8, color: primaryColor),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
