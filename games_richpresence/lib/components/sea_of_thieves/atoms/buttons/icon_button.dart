import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/colors/colors.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class SotIconButton extends StatefulWidget {
  final void Function() onPressed;
  final IconData icon;

  const SotIconButton({super.key, required this.onPressed, required this.icon});

  @override
  State<SotIconButton> createState() => _SotIconButtonState();
}

class _SotIconButtonState extends State<SotIconButton> {
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
                  isHovering
                      ? Assets.seaOfThieves.svg.buttons.iconButtonHover
                      : Assets.seaOfThieves.svg.buttons.iconButton,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                  clipBehavior: Clip.hardEdge)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              widget.icon,
              color: SotColors.white,
              size: 20,
            ),
          ),
        ]),
      ),
    );
  }
}
