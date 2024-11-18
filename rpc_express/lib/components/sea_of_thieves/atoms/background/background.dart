import 'package:flutter/material.dart';

class SotBackground extends StatefulWidget {
  final Widget child;

  const SotBackground({super.key, required this.child});

  @override
  State<SotBackground> createState() => _SotBackgroundState();
}

class _SotBackgroundState extends State<SotBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(1, 13, 11, 1),
        Color.fromRGBO(11, 30, 36, 1),
        Color.fromRGBO(11, 30, 36, 1),
        Color.fromRGBO(1, 13, 11, 1)
      ])),
      child: widget.child,
    );
  }
}
