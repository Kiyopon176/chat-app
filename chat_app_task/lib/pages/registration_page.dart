import 'package:chat_app_task/auth/auth_service.dart';
import 'package:chat_app_task/widgets/my_button.dart';
import 'package:chat_app_task/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  void register(BuildContext context) async{
    final auth = AuthService();
    if(_pwController.text == _confirmPwController.text){
      try {
        auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      } on FirebaseAuthException catch (e) {
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'Unknown error occurred'),
        ),
      );
      }
    }
    else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Password does not match', style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),),
        ));
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
            const SizedBox(height: 50,),
            Icon(Icons.person, size: 100,color: Theme.of(context).colorScheme.secondary,),
            Text("Let's create an account", style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary
            ),),
            const SizedBox(height: 19,),
            MyTextField(hintText: "Email",obscureText: false, controller: _emailController,),
            const SizedBox(height: 20,),
            MyTextField(hintText: "Password", obscureText: true, controller: _pwController,),
            const SizedBox(height: 20,),
            MyTextField(hintText: "Confirm password", obscureText: true, controller: _confirmPwController,),
            const SizedBox(height: 20,),
            MyButton(text: "Register", onTap: () => register(context),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Let's login now", style: TextStyle(
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

