import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/class/games/game_object.dart';

class ColoredContainer extends StatefulWidget {
  final GameObject game;
  final Widget child;
  final EdgeInsets padding;
  const ColoredContainer({super.key, required this.game, required this.child, required this.padding});

  @override
  State<ColoredContainer> createState() => _ColoredContainerState();
}

class _ColoredContainerState extends State<ColoredContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
          color: widget.game.gameSelectionBackgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: widget.child,
    );
  }
}
