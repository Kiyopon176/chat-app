import 'package:chat_app_task/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void logOut() async{
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(actions: [IconButton(onPressed: logOut, icon: const Icon(Icons.logout))],),
      body: Center(
        child: Text("Home Page", style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),),
      ),
    );
  }
}
