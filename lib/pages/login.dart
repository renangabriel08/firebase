import 'package:firebase/controllers/cadastro.dart';
import 'package:firebase/controllers/login.dart';
import 'package:firebase/controllers/validator.dart';
import 'package:firebase/widgets/icone_btn.dart';
import 'package:firebase/widgets/linha.dart';
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

  bool senhaOculta = true;
  IconData icone = Icons.visibility;

  void mostrarEsconderSenha() {
    setState(() {
      if (senhaOculta) {
        senhaOculta = false;
        icone = Icons.visibility_off;
      } else {
        senhaOculta = true;
        icone = Icons.visibility;
      }
    });
  }

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
                        obscureText: senhaOculta,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text('Senha'),
                          suffixIcon: IconButton(
                            onPressed: () => mostrarEsconderSenha(),
                            icon: Icon(
                              icone,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .05),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Linha(),
                      Text(
                        'Entrar com',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Linha(),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => LoginController.logarGoogle(),
                        child: const IconeBtn(icone: Icons.email_outlined),
                      ),
                      GestureDetector(
                        onTap: () => LoginController.logarFacebook(),
                        child: const IconeBtn(icone: Icons.facebook),
                      ),
                      GestureDetector(
                        onTap: () => CadastroController.cadastrarTelefone(),
                        child: const IconeBtn(icone: Icons.call),
                      )
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
                      LoginController.logarEmail(email, senha, context);
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/cadastro'),
                        child: const Text('Criar conta'),
                      ),
                    ],
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
