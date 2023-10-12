import 'package:firebase/widgets/myToast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController {
  static logarEmail(String email, String senha, context) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
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

  static logarGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final a = googleSignIn.signIn();

    print(a);
  }

  static Future<UserCredential> logarFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
