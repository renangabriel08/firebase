import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificaton {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static getToken() async {
    await firebaseMessaging.requestPermission();
    final token = await firebaseMessaging.getToken();
    print(token);
  }
}
