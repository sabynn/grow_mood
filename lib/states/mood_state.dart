import 'package:grow_mood/states/global_state.dart';
import 'package:grow_mood/utils/widget_functions.dart';

class MoodState {
  final listOfMoods = [
    "very_unpleasant",
    "unpleasant",
    "neutral",
    "pleasant",
    "very_pleasant"
  ];

  String _chosenMood = 'neutral';
  int _sliderValue = 2;

  String? get getChosenMood => _chosenMood;

  int get getSliderValue => _sliderValue;

  void getMood(String mood) {
    _chosenMood = mood;
  }

  void choseInSlider(double value) async {
    await moodRM.setState((s) {
      s._sliderValue = value.toInt();
      return;
    });
    String mood = listOfMoods[value.toInt()];
    _chosenMood = mood;
    sendAndUpdate(mood);
    print('>>> chose ${value} ${_sliderValue}');
  }
}
