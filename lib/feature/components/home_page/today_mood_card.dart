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
                          "15:00",
                          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Image.network(
                        'https://cdn.discordapp.com/attachments/784066636935331860/1266734084118286409/Component_1.png?ex=66a6e24c&is=66a590cc&hm=419f964e0c267ebe7f8df5e4b670b0645b73a848b935c977d7bf363a470963fc&'
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
