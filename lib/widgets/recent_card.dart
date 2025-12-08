import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentCard extends StatelessWidget {
  final String title;

  final String details;
  final String iconPath;
  final Color backgroundColor;

  const RecentCard({
    super.key,
    required this.title,
    required this.details,
    required this.iconPath,
    required this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(16),
      decoration:   BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,

            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                details,
                style: GoogleFonts.manrope(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const VerticalDivider(
                color: Colors.white, // Color of the line
                width: 10, // Horizontal space the divider occupies
                thickness: 1,
                indent: 8,
                endIndent: 8, // Actual thickness of the line drawn
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(iconPath, width: 60, height: 60),
            ],
          ),
        ],
      ),
    );
  }
}
