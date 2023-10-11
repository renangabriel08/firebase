import 'package:firebase/controllers/login.dart';
import 'package:firebase/controllers/validator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: height * .05),
                  Column(
                    children: [
                      TextFormField(
                        validator: (value) => Validator.validarDados(email),
                        onChanged: (value) => email = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Email'),
                        ),
                      ),
                      SizedBox(height: height * .02),
                      TextFormField(
                        validator: (value) => Validator.validarDados(senha),
                        onChanged: (value) => senha = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Senha'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .05),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      LoginController.logar(email, senha, context);
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
