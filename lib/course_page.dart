import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum/Course.dart';
import 'package:plum/widgets/course_card.dart';

class CoursesPage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: 'Animations \nin flutter',
      description: 'Build and animate a cross-\nplatform app from scratch',
      details: '20 SECTIONS - 3 HOURS',
      iconPath: 'lib/assets/svg/phone_image.svg',
      backgroundColor: Color(0xFFC08CF4),
    ),
    Course(
      title: 'Build query\napps ',
      description: 'Build query apps with tailwind css ',
      details: '15 SECTIONS - 2 HOURS',
      iconPath: 'lib/assets/svg/web_image.svg',
      backgroundColor: Color(0xFF51A2FF),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text(
                'Courses',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textAlign: .left,
              ),

              _courseList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _courseList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          final currentCourse = courses[index];

          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CourseCard(
              title: currentCourse.title,
              iconPath: currentCourse.iconPath,
              description: currentCourse.description,
              details: currentCourse.details,
              backgroundColor: currentCourse.backgroundColor,
            ),
          );
        },
      ),
    );
  }
}
