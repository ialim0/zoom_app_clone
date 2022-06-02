import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_apps/controllers/jitsi_controller.dart';
import 'package:zoom_apps/views/screens/video_call_screen.dart';
import 'package:zoom_apps/views/screens/widgets/reuseable_icon.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiController _jitsiController = JitsiController();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ReuseableIcon(
                    icon: Icons.videocam,
                    text: 'Créer une réunion  ',
                    onPressed: createNewMeeting,
                  ),
                  ReuseableIcon(
                    icon: Icons.add_box_rounded,
                    text: 'Rejoindre une réunion à l\'aide ID ',
                    onPressed: joinMeeting,
                  ),
                ],
              ),
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
