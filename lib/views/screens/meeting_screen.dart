import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_apps/controllers/jitsi_controller.dart';
import 'package:zoom_apps/views/screens/widgets/reuseable_icon.dart';

class MeetingScreen extends StatelessWidget {
  final JitsiController _jitsiController = JitsiController();
  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                ReuseableIcon(
                  icon: Icons.videocam,
                  text: 'New meeting',
                  onPressed: createNewMeeting,
                ),
                ReuseableIcon(
                  icon: Icons.add_box_rounded,
                  text: 'Join Meeting',
                  onPressed: () {
                    print('Join meeting');
                  },
                ),
                ReuseableIcon(
                  icon: Icons.calendar_today,
                  text: 'Schedul',
                  onPressed: () {},
                ),
                ReuseableIcon(
                  icon: Icons.arrow_upward,
                  text: 'Share Screen',
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Create/Join Meetings with just a Click',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
