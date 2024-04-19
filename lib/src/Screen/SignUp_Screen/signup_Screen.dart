import 'package:flutter/material.dart';
import 'package:khata_book/src/Constarints/images.dart';
import 'package:khata_book/src/Constarints/sizes.dart';

import '../../Common Widget/Form/form_header_widget.dart';
import '../../Constarints/text_string.dart';
import 'Layout/signup_screen_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormHeaderWidget(
                  image: logoImage,
                  title: signUpTitle,
                  subTitle: signUpSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                SignupFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
