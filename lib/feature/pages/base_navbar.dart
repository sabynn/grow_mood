import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/pages/home_page.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:grow_mood/states/navbar_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../theme/base_colors.dart';

class BasePage extends StatefulWidget {
  BasePage({super.key, required this.body});

  Widget body;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 32, right: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navBarIcon(
                  navbarRM.state.getRoute == '/home'
                      ? 'assets/images/icon_home_active.png'
                      : 'assets/images/icon_home_inactive.png',
                  'Home', () {
                navbarRM.state.setRoutes('/home');
                setState(() {
                  widget.body = HomePage();
                });
              }),
              _navBarIcon(
                  navbarRM.state.getRoute == '/exchange'
                      ? 'assets/images/icon_exchange_active.png'
                      : 'assets/images/icon_exchange_inactive.png',
                  'Exchange', () {
                navbarRM.state.setRoutes('/exchange');
                setState(() {
                  widget.body = HomePage();
                });
              }),
              _navBarIcon(
                  navbarRM.state.getRoute == '/waste'
                      ? 'assets/images/icon_trash_active.png'
                      : 'assets/images/icon_trash_inactive.png',
                  'Your Waste', () {
                navbarRM.state.setRoutes('/waste');
                setState(() {
                  widget.body = HomePage();
                });
              })
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TopImageBg(context),
            widget.body
          ],
        ),
      ),
    );
  }

  Widget _navBarIcon(String image, String text, void Function()? function) {
    return InkWell(
      onTap: function,
      child: Column(
        children: [
          Container(
            height: 30,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: image.contains('inactive')
                  ? BaseColors.primaryBold
                  : BaseColors.neutralContrast,
            ),
          ),
        ],
      ),
    );
  }
}
