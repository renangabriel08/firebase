import 'package:firebase/widgets/myToast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroController {
  static cadastrarEmail(nome, String email, String senha, context) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: senha,
      )
          .then((UserCredential userCredential) {
        userCredential.user!.updateDisplayName(nome);
        MyToast.gerarToast('Usuário criado com sucesso');
        Navigator.pushNamed(context, '/login');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        MyToast.gerarToast('Email já cadastrado');
      } else if (e.code == 'invalid-email') {
        MyToast.gerarToast('Formato de email inválido');
      } else if (e.code == 'weak-password') {
        MyToast.gerarToast('Senha 6 caracteres');
      }

      print(e.code);
    }
  }

  static cadastrarTelefone() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+55014998297799',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e);
    }
  }
}
