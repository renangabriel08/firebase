import 'package:firebase/widgets/myToast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  static logarEmail(String email, String senha, context) async {
    try {
      final _firebaseAuth = FirebaseAuth.instance;

      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      if (userCredential != null) {
        Navigator.pushNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        MyToast.gerarToast('Usuário não encontrado');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        MyToast.gerarToast('Senha incorreta');
      } else {
        print(e.code);
        MyToast.gerarToast('Erro ao realizar login');
      }
    }
  }
}
