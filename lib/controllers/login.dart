import 'package:firebase/widgets/myToast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  static logar(String email, String senha, context) async {
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
      if (e.code == 'user-not-found') {
        MyToast.gerarToast('Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        MyToast.gerarToast('Senha incorreta');
      } else {
        MyToast.gerarToast('Erro ao realizar login');
      }
    }
  }
}
