import 'package:flutter/material.dart';
import 'package:syspotec_app/core/models/menu_items.dart';

class HomeDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeDrawer({super.key, required this.scaffoldKey});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        if (value != 0) {
          Navigator.pushNamed(context, menuItem.link);
        }
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        ...appMenuItems.map((item) => NavigationDrawerDestination(
          icon: Icon(
            item.icon
          ), 
          label: Text( item.title )
        ))
      ]
    );
  }
}