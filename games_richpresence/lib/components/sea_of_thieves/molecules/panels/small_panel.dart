import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/colors/colors.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class SmallPanel extends StatefulWidget {
  final ImageProvider image;
  final Widget child;
  final String title;
  final String? description;

  const SmallPanel(
      {super.key,
      required this.image,
      required this.child,
      required this.title,
      this.description});

  @override
  State<SmallPanel> createState() => _SmallPanelState();
}

class _SmallPanelState extends State<SmallPanel> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: IntrinsicWidth(
      child: Stack(fit: StackFit.expand, children: [
        Padding(padding: EdgeInsets.all(6), child: Image(image: widget.image)),
        Padding(
            padding: EdgeInsets.all(6),
            child: Opacity(
                opacity: 0.5,
                child: Container(
                  color: SotColors.green,
                ))),
        SvgPicture.asset(Assets.seaOfThieves.svg.panels.smallPanelBackground,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
            clipBehavior: Clip.hardEdge),
        SvgPicture.asset(Assets.seaOfThieves.svg.panels.smallPanelForeground,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
            clipBehavior: Clip.hardEdge),
        Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: SotTextStyles.smallYellow,
                  textAlign: TextAlign.left,
                ),
                if (widget.description != null)
                  Text(
                    widget.description!,
                    style: SotTextStyles.mediumWhite,
                    textAlign: TextAlign.center,
                  ),
                widget.child,
              ],
            ))
      ]),
    ));
  }
}
