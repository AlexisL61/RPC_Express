import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/buttons/squared_button.dart';
import 'package:games_richpresence/components/sea_of_thieves/molecules/panels/name_panel.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/ship.dart';

class ShipButton extends StatefulWidget {
  final Function onPressed;
  final Ship ship;

  const ShipButton({super.key, required this.onPressed, required this.ship});

  @override
  State<ShipButton> createState() => _ShipButtonState();
}

class _ShipButtonState extends State<ShipButton> {
  @override
  Widget build(BuildContext context) {
    return SquaredButton(
        onPressed: widget.onPressed,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(Assets.seaOfThieves.png.theVoyager.path, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                    child: SvgPicture.asset(
                      widget.ship.icon,
                      width: 250,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top:8), child:NamePanel(text: tr("_${widget.ship.name}_name"))),
          ],
        ));
  }
}
