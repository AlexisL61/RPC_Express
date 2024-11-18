import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rpc_express/components/sea_of_thieves/atoms/colors/colors.dart';
import 'package:rpc_express/gen/assets.gen.dart';

class SeaOfThievesSeparator extends StatelessWidget {
  final String icon;

  const SeaOfThievesSeparator({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: SvgPicture.asset(Assets.seaOfThieves.separator.separatorLeft, alignment: Alignment.centerRight)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(SotColors.darkYellow, BlendMode.srcIn),
        ),
      ),
      Expanded(child: SvgPicture.asset(Assets.seaOfThieves.separator.separatorRight, alignment: Alignment.centerLeft)),
    ]);
  }
}
