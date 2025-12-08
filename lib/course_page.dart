import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum/Course.dart';
import 'package:plum/widgets/course_card.dart';
import 'package:plum/widgets/recent_card.dart';

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
  final List<Course> recentcourses = [
    Course(
      title: 'State Machine',
      description: 'Build query apps with tailwind css ',
      details: 'Watch video - 15 mins',
      iconPath: 'lib/assets/svg/web_image.svg',
      backgroundColor: Color(0xFF51A2FF),
    ),
    Course(
      title: 'Animated menu',
      description: 'Build and animate a cross-\nplatform app from scratch',
      details: 'Watch video - 10 mins',
      iconPath: 'lib/assets/svg/phone_image.svg',
      backgroundColor: Color(0xFFC08CF4),
    ),
    Course(
      title: 'State Machine',
      description: 'Build query apps with tailwind css ',
      details: 'Watch video - 15 mins',
      iconPath: 'lib/assets/svg/web_image.svg',
      backgroundColor: Color(0xFF51A2FF),
    ),
    Course(
      title: 'Animated menu',
      description: 'Build and animate a cross-\nplatform app from scratch',
      details: 'Watch video - 10 mins',
      iconPath: 'lib/assets/svg/phone_image.svg',
      backgroundColor: Color(0xFFC08CF4),
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
                  textStyle: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
              ),
              const SizedBox(height: 16,),

              _courseList(),
              const SizedBox(height: 36,),
              Text(
                'Recent',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
              ),
              const SizedBox(height: 16,),
              
              Expanded(child: _recentCourses())
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

  SizedBox _recentCourses() {
    return SizedBox(
      height: 1000,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: recentcourses.length,
        itemBuilder: (BuildContext context, int index) {
          final currentCourse = recentcourses[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: RecentCard(

                title: currentCourse.title,
                iconPath: currentCourse.iconPath,
                details: currentCourse.details,
                backgroundColor: currentCourse.backgroundColor,
              
            ),
          );
        },
      ),
    );
  }
}
