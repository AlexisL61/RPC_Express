import 'package:flutter/material.dart';
import 'package:games_richpresence/pages/helldivers/activity_select/difficulty_activity_select_page.dart';
import 'package:games_richpresence/pages/helldivers/activity_select/difficulty_activity_select_page_view_model.dart';
import 'package:games_richpresence/pages/helldivers/activity_select/planet_select_page.dart';
import 'package:games_richpresence/pages/home/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:games_richpresence/pages/sea_of_thieves/activities/choose_activity.dart';
import 'package:games_richpresence/pages/sea_of_thieves/activities/choose_activity_company.dart';
import 'package:games_richpresence/pages/sea_of_thieves/ships/choose_ship.dart';
import 'package:games_richpresence/pages/sea_of_thieves/ships/choose_ship_players.dart';
import 'package:games_richpresence/pages/the_finals/gamemodes/gamemodes_categories_page.dart';
import 'package:games_richpresence/pages/the_finals/gamemodes/gamemodes_page.dart';
import 'package:games_richpresence/pages/the_finals/group/group_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? fontFamily = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(fontFamily: fontFamily),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(language: context.locale.languageCode, setFontFamily: setFontFamily),
        ChooseShip.route: (context) => ChooseShip(),
        ChooseShipPlayerRoute.route: (context) => ChooseShipPlayerRoute(),
        ChooseActivityCompanyPage.route: (context) => ChooseActivityCompanyPage(),
        ChooseActivityRoute.route: (context) => ChooseActivityRoute(),
        TheFinalsGroupPage.route: (context) => TheFinalsGroupPage(),
        TheFinalsGamemodesCategoriesPage.route: (context) => TheFinalsGamemodesCategoriesPage(),
        TheFinalsGamemodesPageRoute.route: (context) => TheFinalsGamemodesPageRoute(),
        HelldiversPlanetSelectPage.route: (context) => HelldiversPlanetSelectPage(),
        DifficultyActivitySelectPage.route: (context) => DifficultyActivitySelectPage(),
      },
    );
  }

  void setFontFamily(String fontFamily) {
    setState(() {
      this.fontFamily = fontFamily;
    });
  }
}
