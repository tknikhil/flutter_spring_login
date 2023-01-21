import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/drawer/side_menu.dart';
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Drawer(
        child: SideMenu(),
      ),
    );
  }
}