import 'package:chat_app_task/services/auth/auth_service.dart';
import 'package:chat_app_task/widgets/my_button.dart';
import 'package:chat_app_task/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(e.message ?? 'Unknown error occurred'),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Icon(Icons.person, size: 100,color: Theme.of(context).colorScheme.secondary,),
            Text("Welcome!", style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary
            ),),
            SizedBox(height: 19,),
            MyTextField(hintText: "Email",obscureText: false, controller: _emailController,),
            SizedBox(height: 20,),
            MyTextField(hintText: "Password", obscureText: true, controller: _pwController,),
            SizedBox(height: 20,),
            MyButton(text: "Login", onTap: () => login(context),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ", style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now", style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

