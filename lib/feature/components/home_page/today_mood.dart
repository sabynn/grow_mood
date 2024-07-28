import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/components/home_page/today_mood_card.dart';
import 'package:grow_mood/models/mood.dart';
import 'package:grow_mood/states/account_state.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:grow_mood/states/global_state.dart';

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
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: accountRM.state.getHistory,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No history found.'));
                      }

                      final moods = snapshot.data!.docs
                          .map((doc) => Mood.fromFirestore(doc))
                          .toList();

                      return ListView.builder(
                        itemCount: moods.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Mood mood = moods[index];
                          return  Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: TodayMoodCard(isActive: mood.moodDetails.timestamp.toString() == DateTime.now().toString(), mood: mood.moodDetails.name)
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
