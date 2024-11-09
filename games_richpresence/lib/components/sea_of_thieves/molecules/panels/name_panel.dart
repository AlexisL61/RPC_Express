import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/clippers/panel_name_clipper.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class NamePanel extends StatefulWidget {
  final String text;
  const NamePanel({super.key, required this.text});

  @override
  State<NamePanel> createState() => _NamePanelState();
}

class _NamePanelState extends State<NamePanel> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(child: SvgPicture.asset(Assets.seaOfThieves.svg.panels.panelNameShadow, fit: BoxFit.fill)),
      Positioned.fill(
        right: 2,
        bottom: 2,
        child: ClipPath(
          clipper: PanelNameClipper(),
          child: SvgPicture.asset(Assets.seaOfThieves.svg.panels.panelNameBg, fit: BoxFit.fill),
        ),
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            widget.text,
            style: SotTextStyles.smallWhite,
            textAlign: TextAlign.center,
          )),
    ]);
  }
}
