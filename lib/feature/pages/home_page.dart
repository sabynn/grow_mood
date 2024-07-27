import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/components/display_name_text.dart';
import 'package:grow_mood/feature/components/home_page/food_recommendation.dart';
import 'package:grow_mood/feature/components/home_page/today_mood.dart';
import 'package:grow_mood/theme/base_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      children: [
                        Text(
                          todayDate(),
                          style: GoogleFonts.inter(fontSize: 13),
                          textAlign: TextAlign.left,
                        ),
                        const DisplayNameText(),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.green,
                        // onPrimary: Colors.white,
                        // shadowColor: Colors.greenAccent,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        minimumSize: const Size(40, 40),
                      ),
                      onPressed: () => {
                        showMonthPicker(context, onSelected: (month, year) {
                          print('Selected month: $month, year: $year');
                          setState(() {
                            dateController = month;
                            yearController = year;
                          });
                        },
                            initialSelectedMonth:  dateController > 0 ? dateController : DateTime.now().month,
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
                            dialogBackgroundColor: BaseColors.background
                        )
                      },
                      child: Text(
                        formattedDate,
                        style:
                        const TextStyle(color: BaseColors.neutralBoldest),
                      ),
                    )
                  ],
                )),
            const TodayMood(),
          ],
        ),
      ),
    );
  }
}
