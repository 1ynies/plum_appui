import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum/Models/drawer_item.dart';

class MenuRow extends StatelessWidget {
  const MenuRow({
    super.key,
    required this.menu,
    this.selectedmenu = "Home",
    this.onMenuPressed,
  });

  final DrawerItemModel menu;
  final String selectedmenu;
  final Function? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedmenu == menu.title;

    String iconPath = menu.iconPath;
    if (isSelected) {
      if (iconPath.contains('_outline.svg')) {
        iconPath = iconPath.replaceFirst('_outline.svg', '_solid.svg');
      } else if (iconPath.endsWith('.svg')) {
        iconPath = iconPath.replaceFirst('.svg', '_solid.svg');
      }
    }

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          width: isSelected ? 288 - 16 : 0,
          height: 56,
          curve: const Cubic(0.2, 0.8, 0.2, 1),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(12),
          pressedOpacity: 1, // disable touch effect
          onPressed: () {
            if (onMenuPressed != null) {
              onMenuPressed!();
            }
          },
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Opacity(
                  opacity: isSelected ? 1 : 0.6,
                  child: SvgPicture.asset(
                    iconPath,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                menu.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
