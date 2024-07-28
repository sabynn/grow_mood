import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/pages/base_navbar.dart';
import 'package:grow_mood/feature/pages/login_page.dart';
import 'package:grow_mood/feature/pages/space_page.dart';
import 'package:grow_mood/states/account_state.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:grow_mood/theme/base_colors.dart';
import 'package:states_rebuilder/scr/state_management/legacy/injector.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => accountRM.state.getUser != null
                  ? LoginPage()
                  : BasePage(body: const SpacePage())),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: BaseColors.primary,
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Grow Your Mood',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.neutralContrast),
                    ),
                    Text(
                      'with',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.neutralContrast),
                    ),
                    Image.network(
                      "https://media.discordapp.net/attachments/784066636935331860/1266881707781656669/Grab_2019_2.png?ex=66a6c308&is=66a57188&hm=fa420ee1509b7b0a27a24b67ec6f0bc9968b909969509906a0adb89cbb8b43e2&=&format=webp&quality=lossless&width=768&height=282",
                      height: 50,
                    ),
                  ],
                ),
                const Spacer(),
                Expanded(
                  child: Image.network(
                    "https://media.discordapp.net/attachments/784066636935331860/1266882057917698169/Illustraton.png?ex=66a6c35c&is=66a571dc&hm=115cb1cf2ab4f0d2f143aeacec04293c0c3f74388fca60dab9770aead742e6ef&=&format=webp&quality=lossless&width=1080&height=663",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
