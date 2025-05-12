import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/home_screen.dart';
import '../screens/scan_qr_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ScanQrScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  final List<IconData> _icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.expand,
    FontAwesomeIcons.clockRotateLeft,
    FontAwesomeIcons.gear,
  ];

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            icon: FaIcon(
              _icons[index],
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
            label: '',
          );
        }),
      ),
    );
  }
}
