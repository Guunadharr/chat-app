// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/utils/commons.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
