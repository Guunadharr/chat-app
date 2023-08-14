// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/utils/commons.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // login button
  void loginUser() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInwithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                largeSizedBox,

                // logo
                Icon(
                  Icons.message,
                  size: 100,
                  color: secondaryColor,
                ),

                largeSizedBox,

                // welcome back message
                const Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                mediumSizedBox,

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                smallSizedBox,

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                largeSizedBox,
                // sign_in button
                MyButton(
                  text: 'Sign In',
                  onTap: () {
                    loginUser();
                  },
                ),

                largeSizedBox,
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?',
                        style: TextStyle(color: whiteColor)),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
