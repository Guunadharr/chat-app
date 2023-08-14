import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/commons.dart';
import '../widgets/my_button.dart';
import '../widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();

  // sign up user
  void signUp() async {
    if (passwordController.text != cnfPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match!'),
        ),
      );
      return;
    }

    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
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
                  "Let's create an account for you!",
                  style: TextStyle(
                    color: whiteColor,
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

                smallSizedBox,

                // confirm password textfield
                MyTextField(
                  controller: cnfPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                largeSizedBox,
                // signup button
                MyButton(
                  text: 'Signup',
                  onTap: () {
                    signUp();
                  },
                ),

                largeSizedBox,
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(color: whiteColor),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign In',
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
