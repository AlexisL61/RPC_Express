import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:games_richpresence/components/the_finals/molecules/navigation/navigation_view.dart';
import 'package:games_richpresence/components/the_finals/molecules/panels/large_panel.dart';
import 'package:games_richpresence/components/the_finals/molecules/title/title.dart';
import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode.dart';
import 'package:games_richpresence/model/class/game_activities/the_finals/gamemode_category.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/the_finals/gamemodes/gamemodes_page_view_model.dart';

class TheFinalsGamemodesPageRoute extends StatelessWidget {
  static const String route = "/the_finals/gamemodes/gamemodes";

  const TheFinalsGamemodesPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    TheFinalsGamemodeCategory category = ModalRoute.of(context)!.settings.arguments as TheFinalsGamemodeCategory;

    return TheFinalsGamemodesPage(gamemodes: category.gamemodes);
  }
}

class TheFinalsGamemodesPage extends StatefulWidget {
  final List<TheFinalsGamemode> gamemodes;

  const TheFinalsGamemodesPage({super.key, required this.gamemodes});

  @override
  State<TheFinalsGamemodesPage> createState() => _TheFinalsGamemodesPageState();
}

class _TheFinalsGamemodesPageState extends WidgetEventObserver<TheFinalsGamemodesPage> {
  late TheFinalsGamemodesPageViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = TheFinalsGamemodesPageViewModel(gamemodes: widget.gamemodes);
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return TheFinalsNavigationView(
        content: Column(
      children: [TheFinalsTitle(title: tr("_the_finals_select_gamemode")), Expanded(child: _buildGamemodes())],
    ));
  }

  Widget _buildGamemodes() {
    String Function(String) onlineTranslate = viewModel.translationService.onlineTranslate;
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: List.generate(viewModel.gamemodes.length, (index) {
              TheFinalsGamemode gamemode = viewModel.gamemodes[index];
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TheFinalsLargePanel(
                      title: onlineTranslate(gamemode.name),
                      description: onlineTranslate(gamemode.description),
                      image: gamemode.image,
                      onTap: () {
                        viewModel.onGamemodeSelected(gamemode);
                      }));
            }),
          )
        ],
      ),
    );
  }
}
