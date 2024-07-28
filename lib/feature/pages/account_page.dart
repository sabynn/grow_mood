import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/pages/login_page.dart';
import 'package:grow_mood/states/global_state.dart';

import '../../theme/base_colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          accountRM.state.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: const Size(40, 40),
            backgroundColor: BaseColors.primary),
        child: Text(
          'Logout',
          style: GoogleFonts.inter(color: BaseColors.neutralContrast),
        ),
      ),
    );
  }
}
