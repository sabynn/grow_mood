import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/components/display_name_text.dart';
import 'package:grow_mood/feature/components/home_page/food_recommendation.dart';
import 'package:grow_mood/feature/components/home_page/today_mood.dart';
import 'package:grow_mood/theme/base_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  int dateController = 0;
  int? yearController;

  @override
  void initState() {
    dateController = 0; //set the initial value of text field
    yearController = null;
    super.initState();
  }

  String todayDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM').format(now);
    return 'Today, $formattedDate';
  }

  @override
  Widget build(BuildContext context) {
    DateTime date =
        DateTime(yearController ?? DateTime.now().year, dateController);
    String formattedDate = DateFormat('MMM yyyy').format(date);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todayDate(),
                          style: GoogleFonts.inter(fontSize: 13),
                          textAlign: TextAlign.left,
                        ),
                        const DisplayNameText(),
                      ],
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          minimumSize: const Size(40, 40),
                          side: const BorderSide(
                            width: 2.0,
                            color: BaseColors.neutralSoft,
                          ),
                        ),
                        onPressed: () => {
                              showMonthPicker(context,
                                  onSelected: (month, year) {
                                setState(() {
                                  dateController = month;
                                  yearController = year;
                                });
                              },
                                  initialSelectedMonth: dateController > 0
                                      ? dateController
                                      : DateTime.now().month,
                                  initialSelectedYear: 2024,
                                  firstEnabledMonth: 1,
                                  lastEnabledMonth: DateTime.now().month,
                                  firstYear: 2000,
                                  lastYear: DateTime.now().year,
                                  selectButtonText: 'OK',
                                  cancelButtonText: 'Cancel',
                                  highlightColor: BaseColors.primary,
                                  textColor: Colors.white,
                                  contentBackgroundColor: BaseColors.background,
                                  dialogBackgroundColor: BaseColors.background)
                            },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: BaseColors.neutralBoldest,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              formattedDate,
                              style: GoogleFonts.inter(
                                color: BaseColors.neutralBoldest,
                                fontSize: 12
                              ),
                            ),
                          ],
                        ))
                  ],
                )),
            const TodayMood(),
            const Padding(
                padding: EdgeInsets.only(top: 24), child: FoodRecommendation()),
          ],
        ),
      ),
    );
  }
}
