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
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 56,

          // decoration: BoxDecoration(
          //   color: Colors.blue,
          //   borderRadius: BorderRadius.circular(10),
          // ),
        ),

        CupertinoButton(
          pressedOpacity: 1,
          onPressed: (){},
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Opacity(
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    menu.iconPath,
                    width: 19,
                    height: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                menu.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
