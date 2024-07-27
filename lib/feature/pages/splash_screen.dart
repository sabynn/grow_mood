import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/pages/login_page.dart';
import 'package:grow_mood/states/account_state.dart';
import 'package:states_rebuilder/scr/state_management/legacy/injector.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final account = Injector.getAsReactive<AccountState>();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      print('>>> MASUKK');
      // User? user = FirebaseAuth.instance.currentUser;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);

      // if (user == null) {
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => const LoginPage()),
      //       (route) => false);
      // } else {
      //   if (kDebugMode) {
      //     print(user.email);
      //   }
      //
      //   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome To Mood Widget',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),);
  }
}
