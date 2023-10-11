import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout {
  static sair(context) async {
    final _firebaseAuth = FirebaseAuth.instance;

    await _firebaseAuth.signOut().then(
          (value) => Navigator.pushNamed(context, '/login'),
        );
  }
}
