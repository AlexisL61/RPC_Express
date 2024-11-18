import 'package:flutter/material.dart';
import 'package:rpc_express/gen/assets.gen.dart';

class HelldiversBackground extends StatefulWidget {
  final Widget child;

  const HelldiversBackground({super.key, required this.child});

  @override
  State<HelldiversBackground> createState() => _HelldiversBackgroundState();
}

class _HelldiversBackgroundState extends State<HelldiversBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.black, image: DecorationImage(image: Assets.helldivers.images.background.provider(), opacity: 0.5, fit: BoxFit.cover)),
      child: widget.child,
    );
  }
}
