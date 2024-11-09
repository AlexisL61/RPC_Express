import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class SmallButton extends StatefulWidget {
  final void Function() onPressed;
  final String text;

  const SmallButton({super.key, required this.onPressed, required this.text});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (event) {
          isHovering = true;
          setState(() {});
        },
        onExit: (event) {
          isHovering = false;
          setState(() {});
        },
        child: Stack(children: [
          Positioned.fill(
              child: SvgPicture.asset(
                  isHovering ? Assets.seaOfThieves.svg.buttons.greenButtonSpriteHover : Assets.seaOfThieves.svg.buttons.greenButtonSpriteOff,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                  clipBehavior: Clip.hardEdge)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.text,
              style: SotTextStyles.smallWhite,
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
