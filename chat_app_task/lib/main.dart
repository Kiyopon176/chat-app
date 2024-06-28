import 'package:chat_app_task/services/auth/auth_gate.dart';
import 'package:chat_app_task/services/auth/login_or_register.dart';
import 'package:chat_app_task/firebase_options.dart';
import 'package:chat_app_task/pages/home_page.dart';
import 'package:chat_app_task/pages/login_page.dart';
import 'package:chat_app_task/pages/registration_page.dart';
import 'package:chat_app_task/themes/light_theme..dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Screen());
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
      theme: lightMode,
    );
  }
}
