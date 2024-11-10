
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/responsive/responsive_data.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/components/sea_of_thieves/molecules/activities/activity_widget.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity_category.dart';

class ActivityCategoryWidget extends StatelessWidget {
  final SeaOfThievesActivityCategory activityCategory;
  final String Function(String) onlineTr;
  final Function(SeaOfThievesActivity) onActivitySelected;

  const ActivityCategoryWidget({super.key, required this.activityCategory, required this.onlineTr, required this.onActivitySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(activityCategory.icon, width: 50, height: 50),
            SizedBox(width: 20),
            Text(onlineTr(activityCategory.name),
                style: SotTextStyles.mediumWhite),
          ],
        ),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveData.getPadding(
                    MediaQuery.of(context).size.width)),
            child: SizedBox(
              child: AlignedGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                controller: ScrollController(),
                  crossAxisCount: ResponsiveData.getColumns(
                      MediaQuery.of(context).size.width),
                  itemCount: activityCategory.activities.length,
                  itemBuilder: (context, index) =>
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          onActivitySelected(activityCategory.activities[index]);
                        },
                        child: ActivityWidget(
                            activity: activityCategory.activities[index],
                            onlineTr: onlineTr,),
                      ),
                    )
                  ),
            )),
      ],
    );
  }
}
