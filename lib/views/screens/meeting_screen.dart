import 'package:flutter/material.dart';
import 'package:zoom_apps/views/screens/widgets/reuseable_icon.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            ReuseableIcon(
              icon: Icons.videocam,
              text: 'New meeting',
            ),
            ReuseableIcon(
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            ReuseableIcon(
              icon: Icons.calendar_today,
              text: 'Schedule',
            ),
            ReuseableIcon(
              icon: Icons.arrow_upward,
              text: 'Share Screen',
            ),
          ],
        ),
      ),
    );
  }
}
