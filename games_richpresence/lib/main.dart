import 'package:flutter/material.dart';
import 'package:games_richpresence/pages/home/home.dart';
import 'package:easy_localization/easy_localization.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(language: context.locale.languageCode),
    );
  }
}
