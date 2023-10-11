import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Checagem extends StatefulWidget {
  const Checagem({super.key});

  @override
  State<Checagem> createState() => _ChecagemState();
}

class _ChecagemState extends State<Checagem> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushNamed(context, '/login');
      } else {
        Navigator.pushNamed(context, '/home');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
