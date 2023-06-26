import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:routinica/home_page.dart';
import 'package:routinica/models/PersonalizedTime.dart';
import 'package:routinica/models/work_task.dart';
import 'Healthy_Food.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

//here requiring list for writing no of screens
class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

// so here what it does is texting style i.e there here specified already so now just need to specify this
// variable i.e here write myTextStyle everywhere when u need these specifications for ur text
  final myTextStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff4a063e));

//here initialising the list & keeping the pages under it
  void initState() {
    super.initState();

    var itemHiddenMenu = ItemHiddenMenu(
      name: "Work",
      baseStyle: myTextStyle,
      selectedStyle: myTextStyle,
      colorLineSelected: Colors.deepPurple,
    );
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          // so here whenever clicked on Routinica in the side bar or hidden drawer it shows up the home page
          name: 'ROUTINICA',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        HomePage(),
      ),
      // now here same way can write multiple sections & go to that particular page like here to the WorkScreen pg
      ScreenHiddenDrawer(
        itemHiddenMenu,
        WorkScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "HealthyRecipes",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        HealthyRecipes(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "ChillZone",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.deepPurple,
        ),
        SongPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.shade200,
      //here screens used to show the pages in the screen
      screens: _pages,
      initPositionSelected: 0,
      // this is the slide i.e when clicked on hamburger icon shows that what's the gap like in the menu shown n the slides
      slidePercent: 50,
      //so when shown hidden drawer the page on which we' re to get it curve at corners use this
      contentCornerRadius: 50,
    );
  }
}
