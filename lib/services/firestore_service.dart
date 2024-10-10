import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_5/services/auth_service.dart';

class FirestoreService {
  var db = FirebaseFirestore.instance;

  postFeedBack() async {
    db.collection('FeedBacks').add({
      "user": await FirebaseAuthService().checkUser(),
      "message":"Implementando Firebase",
      "photo":"",
      "create_at":DateTime.now(),
    });

  }
}