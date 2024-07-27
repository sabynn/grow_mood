import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/components/home_page/today_mood_card.dart';

class TodayMood extends StatefulWidget {
  const TodayMood({
    super.key,
  });

  @override
  State<TodayMood> createState() => _TodayMoodState();
}

class _TodayMoodState extends State<TodayMood> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
            child: Text(
              "Today Mood",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            )),
        const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TodayMoodCard(isActive: true, mood: "Very Pleasent")),
                  Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TodayMoodCard(isActive: false, mood: "Neutral")),
                  Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TodayMoodCard(isActive: false, mood: "Very Unpleasant")),
                  Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TodayMoodCard(isActive: false, mood: "Neutral")),
                  Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TodayMoodCard(isActive: false, mood: "Neutral")),
                ],
              ),
            ))
      ],
    );
  }
}
