import 'package:flutter/material.dart';
import 'package:plum/course_page.dart';
import 'package:plum/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:
      Stack(children: [
        DrawerWidget(),
        // CoursesPage()
      ],) ,
    );
  }
  
  
}
