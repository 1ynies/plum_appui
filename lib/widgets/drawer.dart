import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum/Models/drawer_item.dart';
import 'package:plum/widgets/menu_row.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {
  final List<DrawerItemModel> _browsemenuitem = DrawerItemModel.menutems;
  final List<DrawerItemModel> _historymenuitem = DrawerItemModel.menuitems2;
  final String _selectedmenu = DrawerItemModel.menutems[0].title;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: Color(0xff162456),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.4),
                  child: SvgPicture.asset('lib/assets/svg/user_outline.svg'),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .start,
                  children: [
                    Text(
                      'Hiba',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Software engineer',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          

          MenuButtonSection(title: 'BROWSE', menuitems: _browsemenuitem),
          MenuButtonSection(title: 'HISTORY', menuitems: _historymenuitem)
        ],
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  final String title;
  final List<DrawerItemModel> menuitems;
  MenuButtonSection({super.key, required this.title, required this.menuitems});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
              top: 48,
              bottom: 8,
            ),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Column(children: [
            for (var menu in menuitems) ...[
            Divider(
              color: Colors.white.withOpacity(0.1),
              thickness: 1,
              height: 1,
              indent: 16,
              endIndent: 16,
            ),
            MenuRow(menu: menu),
          ],
          ],),
        )
      ],
    );
  }
}
