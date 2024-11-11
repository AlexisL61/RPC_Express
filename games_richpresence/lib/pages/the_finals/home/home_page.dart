import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:games_richpresence/components/the_finals/atoms/background/background.dart';
import 'package:games_richpresence/components/the_finals/molecules/panels/large_panel.dart';
import 'package:games_richpresence/components/the_finals/molecules/title/title.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/the_finals/home/home_page_view_model.dart';

class TheFinalsHomePage extends StatefulWidget {
  final Function(UserData) updateRpc;
  const TheFinalsHomePage({super.key, required this.updateRpc});

  @override
  State<TheFinalsHomePage> createState() => _TheFinalsHomePageState();
}

class _TheFinalsHomePageState extends WidgetEventObserver<TheFinalsHomePage> {
  late TheFinalsHomePageViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = TheFinalsHomePageViewModel(updateRpc: widget.updateRpc);
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return TheFinalsBackground(
        child: Column(
      children: [
        TheFinalsTitle(
          title: "The Finals",
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TheFinalsLargePanel(
                description: viewModel.userData.group != null
                    ? plural("_number_of_players", viewModel.userData.group!.groupSize)
                    : tr("_the_finals_no_team_selected"),
                title: tr("_the_finals_team"),
                image: Assets.theFinals.images.group.path,
                onTap: viewModel.onGroupClicked,
              ),
              SizedBox(width: 40),
              TheFinalsLargePanel(
                description: viewModel.userData.gamemode != null
                    ? viewModel.translationService.onlineTranslate(viewModel.userData.gamemode!.name)
                    : tr("_the_finals_no_gamemode_selected"),
                title: tr("_the_finals_gamemode"),
                image: Assets.theFinals.images.activities.path,
                onTap: viewModel.onActivityClick,
              )
            ],
          ),
        ),
        SizedBox(height: 70),
      ],
    ));
  }
}
