import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/side_menu_tile.dart';

import 'InfoCard.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    print("Drawer");
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xfffd4af37),
        child: SafeArea(
          child: Column(
            children:  [
              InfoCard(name:"Nikhil",profession: "Developer"),
            Padding(
              padding: const EdgeInsets.only(left: 24,top: 32),
              child: Text("Browser".toUpperCase(),style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.brown)),
            ),
              SideMenuTile()
            ],
          ),
        ),
      ),
    );
  }
}




