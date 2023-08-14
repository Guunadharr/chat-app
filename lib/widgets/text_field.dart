// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Color.fromARGB(255, 141, 141, 141))),
    );
  }
}
