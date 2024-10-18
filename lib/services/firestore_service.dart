import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_5/services/auth_service.dart';

class FirestoreService {
  var db = FirebaseFirestore.instance;

  postFeedback(message) async {
    db.collection('Feedbacks').add({
      "user": await FirebaseAuthService().checkUser(),
      "message": message,
      "photo":"",
      "create_at":DateTime.now(),
    });
  }

  getFeedback() async {
    try {
      var feedbacks = await db.collection('Feedbacks').orderBy('create_at', descending: true).get();
      return(feedbacks.docs);
    } catch (e) {
      throw e;
    }
  }
}