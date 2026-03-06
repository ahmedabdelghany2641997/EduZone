import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_style.dart';

class CourseVideosScreen extends StatefulWidget {
  const CourseVideosScreen({super.key});

  @override
  State<CourseVideosScreen> createState() => _CourseVideosScreenState();
}

class _CourseVideosScreenState extends State<CourseVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xff153c62),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.layoutBottomNavBarScreen);
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey),
        ),
        title: Text(AppStrings.courseVideos, style: AppTextStyle.screenTitle),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Into to Dart",style: AppTextStyle.s20bold(context),),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(flex: 10, child: Text("desc for this video you can take look for this course")),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_filled,
                              size: 25,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
