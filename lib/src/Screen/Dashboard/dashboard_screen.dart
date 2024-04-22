import 'package:flutter/material.dart';
import 'package:khata_book/src/Constarints/colors.dart';
import 'package:khata_book/src/Screen/LoginScreen/Layout/login_screen.dart';

import '../../features/authentication/controller/logoutController.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          });
        },
        icon: const Icon(
          Icons.logout,
        ),
      ),
    )));
  }
}
