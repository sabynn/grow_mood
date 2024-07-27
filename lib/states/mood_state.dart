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
  String _moodDescription = '';
  int _sliderValue = 2;

  String? get getChosenMood => _chosenMood;
  String? get getMoodDescription => _moodDescription;

  int get getSliderValue => _sliderValue;

  void getMood(String mood) {
    _chosenMood = mood;
  }

  void setMood(String mood) async {
    await moodRM.setState((s) {
      s._chosenMood = mood;
      return;
    });
  }

  void setDescription(String desc) async {
    await moodRM.setState((s) {
      s._moodDescription = desc;
      return;
    });
  }

  void choseInSlider(double value) async {
    await moodRM.setState((s) {
      s._sliderValue = value.toInt();
      return;
    });
    String mood = listOfMoods[value.toInt()];
    _chosenMood = mood;
    sendAndUpdateMood(mood);
    print('>>> chose ${value} ${_sliderValue}');
  }
}
