import 'package:flutter/material.dart';
import 'package:zoom_apps/utils/colors.dart';
import 'package:zoom_apps/views/screens/contact_screen.dart';
import 'package:zoom_apps/views/screens/history_screen.dart';
import 'package:zoom_apps/views/screens/meeting_screen.dart';
import 'package:zoom_apps/views/screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final List pages = [
    MeetingScreen(),
    historyScreen(),
    contactScreen(),
    settingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: footerColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & chat',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meeting'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
