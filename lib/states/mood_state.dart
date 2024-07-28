import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grow_mood/models/food.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:http/http.dart' as http;

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

  List<FoodRecommendation> _recommendations = [];

  List<FoodRecommendation> get getRecommendations => _recommendations;

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

  Future<GenerateFoodResponse> fetchFoodRecommendation(String? mood,
      String? description) async {
    final queryParameters = {
      'mood': mood,
      'description': description,
    };

    final response = await http.post(
      Uri.parse('http://34.101.105.147:8000/recommendation'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(queryParameters),
    );

    if (response.statusCode == 200) {
      GenerateFoodResponse result = GenerateFoodResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      await moodRM.setState((s) {
        s._recommendations = result.recommendation ?? [];
        return;
      });
      return result;
    } else {
      throw Exception('Failed to load recommendation');
    }
  }

  Future<void> setMoodRecommendation(
      List<FoodRecommendation> foodRecommendation) async {
    try {
      var data = {
        "userId": "",
        "mood": _chosenMood,
        "description": _moodDescription,
        "timestamp": DateTime.now(),
        "recommendations": foodRecommendation
      };
      var collection = FirebaseFirestore.instance.collection('Mood');
      collection
          .add(data) // <-- Your data
          .then((_) => print('>>> Added'))
          .catchError((error) => print('>>> Add failed: $error'));
    } catch (e) {
      rethrow;
    }
  }
}
