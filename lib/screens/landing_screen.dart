import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:babysitter/components/badge_hoc.dart';
import 'package:babysitter/components/image_button.dart';
import 'package:babysitter/providers/profiles.dart';
import 'package:babysitter/screens/profile.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('הצעות עבודה'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        leading: ImageButton(
          image: Image.asset('images/filter.png'),
          onTap: () {},
        ),
        actions: [
          BadgeHOC(
            badge: '1',
            child: IconButton(
              icon: const Icon(Icons.notifications_active_outlined, size: 32),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(20.0),
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6,
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const Text('Menu 1'),
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ProfilesState(),
          ),
        ],
        child: Consumer<ProfilesState>(
          builder: (ctx, profileState, _) => ProfilePage(),
        ),
      ),
      const Text('Menu 3'),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return const ['people', 'home', 'time']
        .map(
          (e) => PersistentBottomNavBarItem(icon: Image.asset('images/$e.png')),
        )
        .toList();
  }
}
