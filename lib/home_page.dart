import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plum/course_page.dart';
import 'package:plum/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isDrawerOpen = false;

  final springDesc = const SpringDescription(
    mass: 0.1,
    stiffness: 40,
    damping: 5,
  );

  void onMenuPress() {
    if (isDrawerOpen) {
      _animationController.reverse();
    } else {
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _animationController.animateWith(springAnim);
    }
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      upperBound: 1,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: isDrawerOpen ? Color(0xff162456) : Colors.transparent,
      body: Stack(
        children: [
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(((1 - _animation.value) * -30) * math.pi / 180)
                    ..translate((1 - _animation.value) * -300),
                  child: child,
                );
              },
              child: FadeTransition(
                opacity: _animation,
                child: DrawerWidget(),
              ),
            ),
          ),
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 - (_animation.value * 0.1),
                  child: Transform.translate(
                    offset: Offset(_animation.value * 265, 0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY((_animation.value * 30) * math.pi / 180),
                      child: child,
                    ),
                  ),
                );
              },
              child: CoursesPage(),
            ),
          ),
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SafeArea(
                  child: Row(
                    children: [
                      SizedBox(width: _animation.value * 216),
                      child!,
                    ],
                  ),
                );
              },
              child: GestureDetector(
                onTap: onMenuPress,
                child: Container(
                  width: 44,
                  height: 44,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44 / 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    child: SvgPicture.asset('lib/assets/svg/delete.svg'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
