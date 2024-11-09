import 'package:dart_discord_rpc/dart_discord_rpc_native.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:games_richpresence/main.dart';
import 'package:games_richpresence/providers/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DiscordRPC.initialize();
  Provider();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en')], path: 'assets/translations', fallbackLocale: Locale('en'), child: MyApp()),
  );
}
