import 'package:flutter/material.dart';
import 'package:grow_mood/theme/base_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: BaseColors.primary,
            height: 50,
          )
        ],
      )
    );
  }
}
