import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key, required this.hintText, required this.obscureText, required this.controller});
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary
        ),
        controller: controller,
      ),
    );
  }
}
