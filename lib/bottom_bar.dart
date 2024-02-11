
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:moton/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'chat_list.dart';
import 'home.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  late PersistentTabController controler;

  @override
  Widget build(BuildContext context) {
    controler = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
        hideNavigationBar: false,
        context,
        controller: controler,
        screens: _buildScreens(),
        items: navBarItems(),
        navBarStyle: NavBarStyle.neumorphic,
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ));
  }

  List<Widget> _buildScreens() {
    return [ const Home(), const ChatList(), const Profile()];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.green.withOpacity(0.2)),
      PersistentBottomNavBarItem(
          icon: const Icon(Ionicons.chatbubble_outline),
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.green.withOpacity(0.2)),
      PersistentBottomNavBarItem(
          icon: const Icon(Ionicons.person),
          activeColorPrimary: Colors.black,
          activeColorSecondary: Colors.green.withOpacity(0.2)),
    ];
  }
}
