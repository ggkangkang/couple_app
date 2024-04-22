import 'package:coupple_app/core/const.dart';
import 'package:coupple_app/core/counter.dart';
import 'package:coupple_app/core/utils.dart';
import 'package:coupple_app/core/widget/dialog/profile_dialog.dart';
import 'package:coupple_app/core/widget/icon_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDayPage extends StatefulWidget {
  const ShowDayPage(
      {super.key,
      required this.horizontalPadding,
      required this.verticalPadding});

  final double horizontalPadding;
  final double verticalPadding;

  @override
  State<ShowDayPage> createState() => _ShowDayPageState();
}

class _ShowDayPageState extends State<ShowDayPage> {
  DateTime? firstDate;
  int dayTgt = 0;

  Future<void> loadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? date = prefs.getString(firstDateKey);
    if (date != null) {
      final datetime = DateTime.parse(date);
      setState(() {
        firstDate = datetime;
      });
      updateDayTgt(datetime);
    }
  }

  Future<void> updateDayTgt(DateTime? date) async {
    if (date != null) {
      final int counterDay = DateCounter.day(date);
      setState(() {
        dayTgt = counterDay;
      });
    }
  }

  Future<void> showIconDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) => ProfileDialog(
              image: Image.asset('assets/icon/woman.png'),
              name: 'Honey',
              onPressed: () {},
            ));
  }

  @override
  void initState() {
    loadDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor.withOpacity(0.6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Together for',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  dayTgt.toString(),
                  style: GoogleFonts.bebasNeue(
                      fontSize: 40, color: Colors.red[200]),
                ),
                Text(
                  firstDate != null ? formatDate(firstDate!) : '',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconWithLabel(
                label: 'Baby',
                imagePath: 'assets/icon/man.png',
                onTap: () {
                  showIconDialog(context);
                },
              ),
              Image.asset(
                "assets/icon/heart.png",
                height: 35,
              ),
              IconWithLabel(
                label: 'Cutie Pie',
                imagePath: 'assets/icon/woman.png',
                onTap: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
