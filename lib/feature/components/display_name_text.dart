import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DisplayNameText extends ReactiveStatelessWidget {
  const DisplayNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      '${accountRM.state.getUser?.name} Moods',
      style: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}