import 'package:firebase/options/firebase_options.dart';
import 'package:firebase/pages/checagem.dart';
import 'package:firebase/pages/home.dart';
import 'package:firebase/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/checagem': (context) => const Checagem(),
        '/login': (context) => const Login()  
      },
      initialRoute: '/checagem',
    );
  }
}
