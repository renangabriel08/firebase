import 'package:firebase/controllers/Cadastro.dart';
import 'package:firebase/controllers/validator.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';

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

  bool confirmarSenhaOculta = true;
  IconData iconeConfirmarSenha = Icons.visibility;

  void mostrarEsconderConfirmarSenha() {
    setState(() {
      if (confirmarSenhaOculta) {
        confirmarSenhaOculta = false;
        iconeConfirmarSenha = Icons.visibility_off;
      } else {
        confirmarSenhaOculta = true;
        iconeConfirmarSenha = Icons.visibility;
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
                    'Cadastro',
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
                        validator: (value) => Validator.validarDados(nome),
                        onChanged: (value) => nome = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Nome'),
                        ),
                      ),
                      SizedBox(height: height * .02),
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
                      SizedBox(height: height * .02),
                      TextFormField(
                        validator: (value) => Validator.validarConfirmarSenha(
                          senha,
                          confirmarSenha,
                        ),
                        onChanged: (value) => senha = value,
                        obscureText: confirmarSenhaOculta,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text('Confirmar senha'),
                          suffixIcon: IconButton(
                            onPressed: () => mostrarEsconderConfirmarSenha(),
                            icon: Icon(
                              iconeConfirmarSenha,
                              color: Colors.deepPurple,
                            ),
                          ),
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
                      CadastroController.cadastrarEmail(
                        nome,
                        email,
                        senha,
                        context,
                      );
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text('Faça login'),
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
