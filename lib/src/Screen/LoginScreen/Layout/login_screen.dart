import 'package:flutter/material.dart';
import 'package:khata_book/src/Constarints/images.dart';
import 'package:khata_book/src/Constarints/text_string.dart';

import 'package:khata_book/src/Screen/LoginScreen/Layout/login_footer_widget.dart';
import 'package:khata_book/src/Screen/LoginScreen/login_form.dart';

import '../../../Common Widget/Form/form_header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: logoImage,
                  title: loginTitle,
                  subTitle: loginSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
