import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:states_rebuilder/scr/state_management/listeners/on_reactive.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import 'food_recommendation_card.dart';

class FoodRecommendation extends ReactiveStatelessWidget {
  const FoodRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    var recommendation = moodRM.state.getRecommendations;
    print('>>> recommendation ${recommendation}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
            child: Text(
              "Food Recommendation",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            )),
        OnReactive(
          () => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: FoodRecommendationCard(
                name: 'Dark Chocolate',
                description: 'Sugar boost serotonin levels.',
                internalLink:
                    'https://food.grab.com/id/id/restaurants?search=dark%20chocolate&support-deeplink=true&searchParameter=dark%20chocolate',
              )),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: FoodRecommendationCard(
              name: 'Dark Chocolate',
              description: 'Sugar boost serotonin levels.',
              internalLink:
              'https://food.grab.com/id/id/restaurants?search=dark%20chocolate&support-deeplink=true&searchParameter=dark%20chocolate',
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: FoodRecommendationCard(
              name: 'Dark Chocolate',
              description: 'Sugar boost serotonin levels.',
              internalLink:
              'https://food.grab.com/id/id/restaurants?search=dark%20chocolate&support-deeplink=true&searchParameter=dark%20chocolate',
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: FoodRecommendationCard(
              name: 'Dark Chocolate',
              description: 'Sugar boost serotonin levels.',
              internalLink:
              'https://food.grab.com/id/id/restaurants?search=dark%20chocolate&support-deeplink=true&searchParameter=dark%20chocolate',
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: FoodRecommendationCard(
              name: 'Dark Chocolate',
              description: 'Sugar boost serotonin levels.',
              internalLink:
              'https://food.grab.com/id/id/restaurants?search=dark%20chocolate&support-deeplink=true&searchParameter=dark%20chocolate',
            )),
        ...recommendation.map((data) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: FoodRecommendationCard(
              name: data.name ?? '-',
              description: data.description ?? '-',
              internalLink:
                  'https://food.grab.com/id/id/restaurants?search=${Uri.encodeComponent('Dark Chocolate')}&support-deeplink=true&searchParameter=dark%20chocolate',
            ),
          );
        }),
      ],
    );
  }
}
