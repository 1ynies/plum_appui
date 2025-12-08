import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String details;
  final String iconPath;
  final Color backgroundColor;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.details,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 290,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                title,

                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                description,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                details,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/image.png'),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/image.png'),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(iconPath, width: 60, height: 60),
          ),
        ],
      ),
    );
  }
}
