import 'package:flutter/material.dart';
import 'package:zoom_apps/controllers/auth_controller.dart';
import 'package:zoom_apps/controllers/jitsi_controller.dart';
import 'package:zoom_apps/utils/colors.dart';
import 'package:zoom_apps/views/screens/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  final AuthController _authController = AuthController();
  final JitsiController _jitsiController = JitsiController();

  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: _authController.user.displayName);
    super.initState();
  }

  _joinMeeting() {
    _jitsiController.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join a meeting',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: ' room id',
              contentPadding: EdgeInsets.all(20),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'username',
              contentPadding: EdgeInsets.all(20),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          SizedBox(
            height: 10,
          ),
          MeetingOption(
            text: 'Turn off Video',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
