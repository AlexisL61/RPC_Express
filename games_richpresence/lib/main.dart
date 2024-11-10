import 'package:flutter/material.dart';
import 'package:games_richpresence/pages/home/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:games_richpresence/pages/sea_of_thieves/activities/choose_activity.dart';
import 'package:games_richpresence/pages/sea_of_thieves/activities/choose_activity_company.dart';
import 'package:games_richpresence/pages/sea_of_thieves/ships/choose_ship.dart';
import 'package:games_richpresence/pages/sea_of_thieves/ships/choose_ship_players.dart';

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
      },
    );
  }

  void setFontFamily(String fontFamily) {
    setState(() {
      this.fontFamily = fontFamily;
    });
  }
}