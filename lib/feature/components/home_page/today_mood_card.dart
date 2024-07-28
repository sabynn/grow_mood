import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/theme/base_colors.dart';

class TodayMoodCard extends StatefulWidget {
  final bool isActive;
  final String mood;
  // final DateTime dateTime;
  const TodayMoodCard({
    super.key,
    required this.isActive,
    required this.mood,
    // required this.
  });

  @override
  State<TodayMoodCard> createState() => _TodayMoodCardState();
}

class _TodayMoodCardState extends State<TodayMoodCard> {

  List<String> imageBasedOnMood  = [
    "https://cdn.discordapp.com/attachments/784066636935331860/1266930134368260178/mood_very_unpleasant.png?ex=66a6f022&is=66a59ea2&hm=45f754dcfd1cc4cbdc71ae65adb05123423e9ead6e2c0a4fb3d5948c33b08540&",
    "https://cdn.discordapp.com/attachments/784066636935331860/1266930133525336166/mood_unpleasant.png?ex=66a6f022&is=66a59ea2&hm=9a21ed1f322b5617de006ff7c24890aa6b2f6bc05b5c4d60dfa76a827eb0d746&",
    "https://cdn.discordapp.com/attachments/784066636935331860/1266930132594200596/mood_neutral.png?ex=66a6f022&is=66a59ea2&hm=fb20e3525e543485c88c45be60d8cdbc0eb9ab54cf4b9c59ff34bb4cfc639515&",
    "https://cdn.discordapp.com/attachments/784066636935331860/1266930133093056522/mood_pleasant.png?ex=66a6f022&is=66a59ea2&hm=e5ce2b482aec29ed0cf18fa40fbaf9829f7445267c2e1e33f8f747eab8dc9036&",
    "https://cdn.discordapp.com/attachments/784066636935331860/1266930133907013652/mood_very_pleasant.png?ex=66a6f022&is=66a59ea2&hm=6d15c925df69979702eff2997bb36b483b37f5a5d2b112a834ed6363436d2354&"
  ];

  Map<String, int> moodMap = {
    "Very Unpleasant": 0,
    "Unpleasant": 1,
    "Neutral": 2,
    "Pleasant": 3,
    "Very Pleasant": 4
  };

  String mood = "Neutral"; // Example mood

  String getImageForMood(String mood) {
    if (moodMap.containsKey(mood)) {
      int moodIndex = moodMap[mood]!;
      return imageBasedOnMood[moodIndex];
    } else {
      return "Invalid mood";
    }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 102,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
                border: widget.isActive
                    ? Border.all(color: BaseColors.primary)
                    : Border.all(color: BaseColors.neutralSoft),
                borderRadius: BorderRadius.circular(4.0)),
            child: Padding(
              padding:const EdgeInsets.all(8),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${moodMap[mood]}:00",
                          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Image.network(
                          getImageForMood(widget.mood),
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        widget.mood,
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
