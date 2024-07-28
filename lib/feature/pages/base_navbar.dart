import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/pages/account_page.dart';
import 'package:grow_mood/feature/pages/home_page.dart';
import 'package:grow_mood/feature/pages/space_page.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../theme/base_colors.dart';

class BasePage extends StatefulWidget {
  BasePage({super.key, required this.body});

  Widget body;

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 32, right: 32),
            child: OnReactive(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navBarIcon(Icons.home_outlined, 'Home', () {
                    // navbarRM.state.setRoutes('/home');
                    // setState(() {
                    //   widget.body = const HomePage();
                    // });
                  }),
                  _navBarIcon(Icons.auto_awesome_outlined, 'Your Space', () {
                    navbarRM.state.setRoutes('/space');
                    setState(() {
                      widget.body = const SpacePage();
                    });
                  }),
                  _navBarIcon(Icons.person_outline, 'Account', () {
                    // navbarRM.state.setRoutes('/account');
                    // setState(() {
                    //   widget.body = const AccountPage();
                    // });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TopImageBg(context),
              widget.body
            ],
          ),
        ),
      ),
    );
  }

  Widget _navBarIcon(IconData icon, String text, void Function()? function) {
    return OnReactive(
      () => InkWell(
        onTap: function,
        child: Column(
          children: [
            Icon(
              icon,
              color: ((navbarRM.state.getRoute! == '/home' && text == 'Home') ||
                      (navbarRM.state.getRoute! == '/space' &&
                          text == 'Your Space') ||
                      (navbarRM.state.getRoute! == '/account' &&
                          text == 'Account'))
                  ? BaseColors.primary
                  : BaseColors.neutral,
              size: 30.0,
            ),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color:
                    ((navbarRM.state.getRoute! == '/home' && text == 'Home') ||
                            (navbarRM.state.getRoute! == '/space' &&
                                text == 'Your Space') ||
                            (navbarRM.state.getRoute! == '/account' &&
                                text == 'Account'))
                        ? BaseColors.primary
                        : BaseColors.neutral,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
