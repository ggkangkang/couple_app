import 'package:coupple_app/core/const.dart';
import 'package:coupple_app/core/counter.dart';
import 'package:coupple_app/core/injection.dart';
import 'package:coupple_app/core/utils.dart';
import 'package:coupple_app/core/widget/couple_body.dart';
import 'package:coupple_app/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DateTime? selectedDate;
  String date = '';
  int dayTgt = 0;

  Future<void> showDateTimePicker(BuildContext context) async {
    final DateTime? picker = await selectDate(context);
    updateDayTgt(picker);
    setState(() {
      selectedDate = picker;
    });
  }

  Future<void> updateDayTgt(DateTime? date) async {
    if (date != null) {
      final int counterDay = DateCounter.day(date);
      setState(() {
        dayTgt = counterDay;
      });
    }
  }

  Future<bool> storeDate(DateTime date) async {
    try {
      String dateString = date.toIso8601String();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(firstDateKey, dateString);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedDate != null) {
      date = formatDateWithDay(selectedDate!);
    } else {
      date = "Select date";
    }

    return Scaffold(
      body: CoupleBody(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select the date you fall in love',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              if (selectedDate != null)
                Text(
                  dayTgt.toString(),
                  style: GoogleFonts.bebasNeue(
                      fontSize: 40, color: Colors.red[200]),
                ),
              TextButton.icon(
                  onPressed: () {
                    showDateTimePicker(context);
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: Text(date)),
              const SizedBox(
                height: 150,
              ),
              if (selectedDate != null)
                FilledButton.icon(
                    onPressed: () async {
                      final storeResult = await storeDate(selectedDate!);
                      if (storeResult) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                    icon: const Icon(Icons.navigate_next),
                    label: const Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
