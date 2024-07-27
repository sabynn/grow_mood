import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:grow_mood/states/mood_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePage extends ReactiveStatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Welcome to Mood Widget',
                  style: GoogleFonts.inter(fontSize: 24),
                ),
              ),
              Text('${moodRM.state.getChosenMood}'),
              OnReactive(
                () => Slider(
                  value: moodRM.state.getSliderValue.toDouble(),
                  max: 4,
                  divisions: 4,
                  onChanged: (chosenValue) {
                    moodRM.state.choseInSlider(chosenValue);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
