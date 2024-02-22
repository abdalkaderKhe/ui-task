import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Placeholder(
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        iconSize: 25,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        selectedIconTheme: const IconThemeData(color: Colors.red),
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: <BottomNavigationBarItem>[
          // for first icon the required icon was not found
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.gamepad_rounded), title: 'Shop'),
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border_rounded),
              title: 'Favorite'),
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.notifications), title: 'Notifications'),
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.fmd_good_rounded), title: 'Near Me'),
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.settings_rounded), title: 'Settings'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {required Icon icon, required String title}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: title,
    );
  }
}
