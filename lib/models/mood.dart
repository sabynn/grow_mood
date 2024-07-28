import 'package:grow_mood/models/food.dart';

class Mood {
  String userId;
  MoodDetails moodDetails;
  List<FoodRecommendation> recommendation;

  Mood({
    required this.userId,
    required this.moodDetails,
    required this.recommendation
  });

}

class MoodDetails {
  DateTime timestamp;
  String name;
  String description;

  MoodDetails({
    required this.timestamp,
    required this.name,
    required this.description,
  });
}

const MoodsList = [
  "very unpleasant",
  "unpleasant",
  "neutral",
  "pleasant",
  "very pleasant"
];

const DescriptionsList = [
  "angry",
  "sad",
  "drained",
  "calm",
  "excited",
  "proud",
];

