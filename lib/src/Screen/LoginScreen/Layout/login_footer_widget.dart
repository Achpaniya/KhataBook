// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:khata_book/src/Constarints/images.dart';
import 'package:khata_book/src/Constarints/text_string.dart';
// import 'package:khata_book/src/Screen/SignUp_Screen/Layout/signup_screen_widget.dart';
import 'package:khata_book/src/Screen/SignUp_Screen/signup_Screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              /* final UserCredential? userCredential = await googleLogin(context);
              if (userCredential != null) {
                Navigator.pushNamed(context, 'dashboard');
              } else {
                // Handle sign-in failure or cancellation
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.red,
                    content: const Text(
                      'Failed to sign in with Google',
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                );
              } */
            },
            label: const Text(signInWithGoogle),
            icon: const Image(
              image: AssetImage(googleLogo),
              width: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevents dismissing dialog by tapping outside
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              );

              // Simulate a delay of 3 seconds before navigating
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushNamed(
                    context, 'signinphone'); // Navigate to phone signin screen
              });
            },
            label: const Text(signInWithPhone),
            icon: const Image(
              image: AssetImage(phoneLogo),
              width: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        /*   TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'signup');
          },
          child: Text.rich(
            TextSpan(
              text: dontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: signupText.toUpperCase(),
                  style: const TextStyle(
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ), */
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'tHaveAnAccount?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible:
                      false, // Prevents dismissing dialog by tapping outside
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  },
                );

                // Simulate a delay of 3 seconds before navigating
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  ); // Navigate to signup screen
                });
              },
              child: Text(
                signupText.toUpperCase(),
                // style: const TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
