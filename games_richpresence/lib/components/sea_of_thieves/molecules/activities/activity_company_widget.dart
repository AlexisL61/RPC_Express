import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity_company.dart';

class CompanyWidget extends StatelessWidget {
  final SeaOfThievesActivityCompany company;

  final String Function(String) onlineTr;

  const CompanyWidget({super.key, required this.company, required this.onlineTr});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: SvgPicture.network(company.backgroundImage, fit: BoxFit.contain)),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 30),
            Expanded(child: Center(child: Image.network(company.image, fit: BoxFit.contain))),
            Expanded(
              flex: 2,
              child:
                  Center(child: Text(onlineTr(company.name), style: SotTextStyles.mediumWhite)),
            ),
            SizedBox(width: 30)
          ],
        ),
      ],
    );
  }
}
