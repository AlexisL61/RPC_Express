import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/clippers/activity_clipper.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/colors/colors.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity.dart';

class ActivityWidget extends StatelessWidget {
  final SeaOfThievesActivity activity;

  final String Function(String) onlineTr;

  const ActivityWidget({super.key, required this.activity, required this.onlineTr});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ClipPath(
          clipper: ActivityClipper(),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        onlineTr(activity.name),
                        style: SotTextStyles.mediumWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.network(activity.image, fit: BoxFit.contain),
                    SizedBox(height: 20),
                    _buildTime(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(onlineTr(activity.description), style: SotTextStyles.smallWhite),
                    ),
                  ],
                ),
              ),
            ),
          )),
    ]);
  }

  Widget _buildTime() {
    List<Widget> widgets = [];
    for (int i = 0; i < activity.length; i++) {
      widgets.add(Image.asset(
        Assets.seaOfThieves.icons.time.path,
        color: SotColors.white,
      ));
    }
    for (int i = 0; i < 5 - activity.length; i++) {
      widgets.add(Image.asset(
        Assets.seaOfThieves.icons.time.path,
        color: SotColors.darkYellow,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${tr("_length")} ", style: SotTextStyles.smallWhite),
        SizedBox(width: 5),
        ...widgets.expand((element) => [element, SizedBox(width: 5)]).toList()
      ],
    );
  }
}
