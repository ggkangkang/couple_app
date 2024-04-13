import 'package:coupple_app/core/const.dart';
import 'package:coupple_app/core/counter.dart';
import 'package:coupple_app/core/utils.dart';
import 'package:coupple_app/core/widget/couple_bottombar.dart';
import 'package:coupple_app/core/widget/my_app_bar.dart';
import 'package:coupple_app/presentation/home/show_day_page.dart';
import 'package:coupple_app/presentation/home/show_event_page.dart';
import 'package:coupple_app/presentation/home/show_location_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;
  int currentIndex = 1;
  int dayTgt = 0;

  PageController pageController = PageController(initialPage: 1);
  final double horizontalPadding = 25;
  final double verticalPadding = 25;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> page = [
      ShowLocationPage(
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding),
      ShowDayPage(
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding),
      ShowEventPage(
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding),
    ];

    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 243, 241, 234),
        floatingActionButton: currentIndex == 2
            ? FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(Icons.add),
              )
            : null,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.22]),
          ),
          child: SafeArea(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(
                    title: 'Couple',
                    horizontalPadding: horizontalPadding,
                    verticalPadding: verticalPadding),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: PageView(
                      onPageChanged: (index) {
                        currentIndex = index;
                      },
                      controller: pageController,
                      children: page),
                ),

                // FilledButton(
                //     onPressed: () {
                //       showDateTimePicker(context);
                //     },
                //     child: const Text('Select Date'))
              ],
            ),
          ),
        ),
        bottomNavigationBar: CoupleBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              _onItemTapped(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined), label: 'Location'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event')
            ]));
  }
}
