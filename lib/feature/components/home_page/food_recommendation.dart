import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/components/home_page/food_recommendation_card.dart';

class FoodRecommendation extends StatefulWidget {
  const FoodRecommendation({
    super.key,
  });

  @override
  State<FoodRecommendation> createState() => _FoodRecommendationState();
}

class _FoodRecommendationState extends State<FoodRecommendation> {
  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: FoodRecommendationCard(
                      name: 'Dark Chocolate',
                      description:
                          'Sugar boost serotonin levels.',
                      internalLink:
                          'https://food.grab.com/id/id/restaurants?search=dark%20chocolate&support-deeplink=true&searchParameter=dark%20chocolate',
                    )
                  ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FoodRecommendationCard(
                      name: 'Dark Chocolate',
                      description:
                      'Sugar boost serotonin levels.',
                      internalLink:
                      'https://food.grab.com/id/id/restaurants?search=${Uri.encodeComponent('Dark Chocolate')}&support-deeplink=true&searchParameter=dark%20chocolate',
                    )
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}
