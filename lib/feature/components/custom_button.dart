import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/theme/base_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final bool transparent;
  final double? heightSize;
  final double fontSize;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.heightSize = 55,
    this.margin = EdgeInsets.zero,
    this.transparent = false,
    this.fontSize = 18,
    this.borderRadius = 10,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heightSize,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: !transparent
              ? BaseColors.primary
              : BaseColors.primaryTranslucent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(
              color:  BaseColors.primary,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
            color: BaseColors.neutralContrast
        ),
        ),
      ),
    );
  }
}