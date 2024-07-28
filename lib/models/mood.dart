import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory Mood.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Mood(
      userId: data['uid'],
      moodDetails: data['mood_details'],
      recommendation: data['recommendation']
    );
  }

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

