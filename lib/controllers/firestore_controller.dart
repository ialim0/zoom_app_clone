import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void addMeetingToFirestore(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdat': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
