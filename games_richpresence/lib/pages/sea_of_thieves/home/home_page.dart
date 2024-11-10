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
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/driven_ship.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/sea_of_thieves/home/home_page_view_model.dart';

class SeaOfThievesHomePage extends StatefulWidget {
  final Function(UserData) updateRpc;

  const SeaOfThievesHomePage({super.key, required this.updateRpc});

  @override
  State<SeaOfThievesHomePage> createState() => _SeaOfThievesHomePageState();
}

class _SeaOfThievesHomePageState extends WidgetEventObserver<SeaOfThievesHomePage> {
  late SeaOfThievesHomePageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SeaOfThievesHomePageViewModel(updateRpc: widget.updateRpc);
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
    SeaOfThievesDrivenShip? drivenShip = viewModel.userData.drivenShip;
    return SizedBox(
      height: 400,
      child: LargePanel(
          image: AssetImage(Assets.seaOfThieves.png.chooseShip.path),
          child: Expanded(child: SizedBox(width: 400)),
          title: tr("_sot_ship"),
          description: drivenShip == null
              ? tr("_no_ship_selected")
              : tr("_sot_${drivenShip.name}_name") + " - " + " " + plural("_number_of_players", drivenShip.players),
          actionText: tr("_sot_ship_select_button"),
          action: () async {
            viewModel.onShipClick();
          }),
    );
  }

  Widget _buildActivityPanel() {
    SeaOfThievesActivity? selectedActivity = viewModel.userData.activity;
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
            }));
  }
}
