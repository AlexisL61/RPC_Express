import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/buttons/icon_button.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/navigation/naviagtion_view.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/separator/separator.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/components/sea_of_thieves/molecules/dialogs/credit_dialog.dart';
import 'package:games_richpresence/components/sea_of_thieves/molecules/panels/large_panel.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/driven_ship.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/sea_of_thieves/home/home_page_view_model.dart';

class SeaOfThievesHomePage extends StatefulWidget {
  const SeaOfThievesHomePage({super.key});

  @override
  State<SeaOfThievesHomePage> createState() => _SeaOfThievesHomePageState();
}

class _SeaOfThievesHomePageState extends WidgetEventObserver<SeaOfThievesHomePage> {
  SeaOfThievesHomePageViewModel viewModel = SeaOfThievesHomePageViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return SotNavigationView(
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: _buildUpperPanel(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _buildShipPanel(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _buildActivityPanel(),
                ),
              ],
            ),
          ),
          _buildBottomPanel()
        ],
      ),
    );
  }

  Widget _buildUpperPanel() {
    return Column(children: [
      Text(tr("_app_title"), style: SotTextStyles.mediumWhite),
      SizedBox(height: 20),
      Separator(icon: Assets.seaOfThieves.icons.sloop),
      SizedBox(height: 40),
    ]);
  }

  Widget _buildBottomPanel() {
    return SotIconButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => CreditDialog(), barrierDismissible: true);
        },
        icon: Icons.favorite);
  }

  Widget _buildShipPanel() {
    SeaOfThievesDrivenShip? drivenShip = viewModel.userData?.drivenShip;
    return SizedBox(
      height: 400,
      child: LargePanel(
          image: AssetImage(Assets.seaOfThieves.png.chooseShip.path),
          child: Expanded(child: SizedBox(width: 400)),
          title: tr("_ship"),
          description: drivenShip == null
              ? tr("_no_ship_selected")
              : tr("_${drivenShip.name}_name") + " - " + " " + plural("_number_of_players", drivenShip.players),
          actionText: tr("_ship_select_button"),
          action: () async {
            // DrivenShip? drivenShip = await Navigator.pushNamed(context, "/choose_ship") as DrivenShip?;
            // if (drivenShip != null) {
            //   viewModel.setDrivenShip(drivenShip);
            //   setState(() {});
            // }
          }),
    );
  }

  Widget _buildActivityPanel() {
    SeaOfThievesActivity? selectedActivity = viewModel.userData?.activity;
    return SizedBox(
        height: 400,
        child: LargePanel(
            image: AssetImage(Assets.seaOfThieves.png.chooseActivity.path),
            child: Expanded(child: SizedBox(width: 400)),
            title: tr("_activity"),
            description: selectedActivity == null
                ? tr("_no_activity_selected")
                : viewModel.translationService.onlineTranslate(selectedActivity.name),
            actionText: tr("_activity_select_button"),
            action: () async {
              viewModel.onActivityClick();
              // Activity? selectedActivity = await Navigator.pushNamed(context, "/choose_activity_company") as Activity?;
              // if (selectedActivity != null) {
              //   viewModel.setActivity(selectedActivity);
              //   setState(() {});
              // }
            }));
  }
}
