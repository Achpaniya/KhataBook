// ignore_for_file: unnecessary_null_comparison, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:khata_book/src/Constarints/colors.dart';
import 'package:khata_book/src/Constarints/sizes.dart';
import 'package:khata_book/src/Constarints/text_string.dart';
import 'package:khata_book/src/Screen/LoginScreen/Layout/login_screen.dart';
import 'package:khata_book/src/features/authentication/controllers/email_password_signup.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  String dropdownValue = 'Vendor'; // Default dropdown value
  bool? isChecked = false;
  bool _showPassword = true;
  bool _showConfirmpassword = true;

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _fullnameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  return 'Please enter your full name';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  // label: Text(textFullName),
                  hintText: textFullName,
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email cannot be empty";
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please enter a valid email");
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                  // label: Text(loginEmail),
                  hintText: loginEmail,
                  prefixIcon: Icon(Icons.email_rounded)),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                  return 'Please enter your phone number';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                // label: Text(textPhone),
                hintText: textPhone,
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
                if (!regex.hasMatch(value)) {
                  return ("please enter valid password min. 6 character");
                } else {
                  return null;
                }
              },
              obscureText: _showPassword,
              decoration: InputDecoration(
                // label: const Text(loginPassword),
                hintText: loginPassword,
                prefixIcon: const Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (_confirmPasswordController.text !=
                    _passwordController.text) {
                  return "Password did not match";
                } else {
                  return null;
                }
              },
              obscureText: _showConfirmpassword,
              decoration: InputDecoration(
                // label: const Text(loginConfirmPassword),
                hintText: loginConfirmPassword,
                prefixIcon: const Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showConfirmpassword = !_showConfirmpassword;
                    });
                  },
                  icon: Icon(_showConfirmpassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            DropdownButtonFormField<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Agent', 'Vendor']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Select a Role',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: isChecked,
                    activeColor: primaryColor,
                    checkColor: whiteColor,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),

                //Dropdown menu

                const SizedBox(
                  height: 20,
                ),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: iAgreeTo,
                            style: TextStyle(fontSize: fontSize)),
                        TextSpan(
                          text: privacyPolicy,
                          style: TextStyle(
                            fontSize: fontSize,
                            // color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: and,
                          style: TextStyle(
                            fontSize: fontSize,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                            text: termsCondition,
                            style: TextStyle(
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text(
                  signupText.toUpperCase(),
                ),
              ),
            ),

            /* TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: alreadyHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: loginText.toUpperCase(),
                        style: const TextStyle(
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ), */
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  alreadyHaveAnAccount,
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
                            color: primaryColor,
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
                              builder: (context) =>
                                  const LoginScreen())); // Navigate to signup screen
                    });
                  },
                  child: Text(
                    loginText.toUpperCase(),
                    // style: const TextStyle(color: secondaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /* void _signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    _showLoadingDialog(context);
    String email = _emailController.text;
    String password = _passwordController.text;

    // authenticate user
    User? user =
        await _auth.signUpWithEmailAndPassword(context, email, password);

    if (user != null) {
      print('User created sucessfully');
      Navigator.pushNamed(context, 'emailverify');
    } else {
      print('Some error occur');
    }

    // add user details
    addUserDetails(
      _fullnameController.text.trim(),
      _phoneController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }
 */
  /*  Future addUserDetails(
      String fullName, String phone, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Full Name': fullName,
      'Phone': phone,
      'Email': email,
      'Password': password,
    });
  } */

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    );

    void_signUp() async {
      String fullname = _fullnameController.text;
      String password = _passwordController.text;
      String phone = _phoneController.text;
      String email = _emailController.text;
      String confirmPassword = _confirmPasswordController.text;
    }
  }
}
