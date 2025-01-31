import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/pages/detail_food_page.dart';
import 'package:grow_mood/theme/base_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodRecommendationCard extends StatefulWidget {
  final String name;
  final String description;
  final String internalLink;

  const FoodRecommendationCard(
      {super.key,
      required this.name,
      required this.description,
      required this.internalLink});

  @override
  State<FoodRecommendationCard> createState() => _FoodRecommendationState();
}

class _FoodRecommendationState extends State<FoodRecommendationCard> {
  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DetailFoodPage()),
        )
      },
      child: SizedBox(
        height: 108,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 108,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth / 4,
                      child: Image.network(
                          'https://cdn.discordapp.com/attachments/784066636935331860/1266749969667330110/Frame_112.png?ex=66a64857&is=66a4f6d7&hm=d624b5ec75d535b232b5105aa38b2f2391182526355c2996272ab2495e81704c&'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.name,
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: BaseColors.neutralBoldest),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Text(
                                widget.description,
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: BaseColors.neutralBold),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(
                          onPressed: () => {
                            launchURL(widget.internalLink),
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Buy in GrabFood',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 2),
                              // Space between text and icon
                              const Icon(
                                Icons.arrow_forward,
                                // Use the appropriate icon for your needs
                                color: Colors.blue,
                                size: 12,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
