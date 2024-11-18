import 'package:flutter/material.dart';
import 'package:rpc_express/components/the_finals/atoms/colors/colors.dart';

class TheFinalsBackground extends StatefulWidget {
  final Widget child;

  const TheFinalsBackground({super.key, required this.child});

  @override
  State<TheFinalsBackground> createState() => _TheFinalsBackgroundState();
}

class _TheFinalsBackgroundState extends State<TheFinalsBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          TheFinalsColors.background,
          TheFinalsColors.backgroundDark,
        ],
        radius: 0.8,
        stops: [
          0.2,
          1.0
        ]),
      ),
      child: widget.child,
    );
  }
}
