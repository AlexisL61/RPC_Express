import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:games_richpresence/components/the_finals/atoms/background/background.dart';

class TheFinalsNavigationView extends StatefulWidget {
  final Widget content;
  const TheFinalsNavigationView({super.key, required this.content});

  @override
  State<TheFinalsNavigationView> createState() => _TheFinalsNavigationViewState();
}

class _TheFinalsNavigationViewState extends State<TheFinalsNavigationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      TheFinalsBackground(child: widget.content),
      Positioned(
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  tr("_back"),
                  style: TextStyle(color: Colors.white),
                ))),
        bottom: 10,
        left: 10,
      )
    ]));
  }
}
