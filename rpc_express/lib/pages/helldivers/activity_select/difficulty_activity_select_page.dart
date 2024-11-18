import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/helldivers/atoms/background/background.dart';
import 'package:rpc_express/components/helldivers/atoms/buttons/difficulty_button.dart';
import 'package:rpc_express/components/helldivers/atoms/buttons/text_button.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/difficulties.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/helldivers/activity_select/difficulty_activity_select_page_view_model.dart';

class DifficultyActivitySelectPage extends StatefulWidget {
  static String route = '/helldivers/activity_select/difficulty';

  const DifficultyActivitySelectPage({super.key});

  @override
  State<DifficultyActivitySelectPage> createState() => _DifficultyActivitySelectPageState();
}

class _DifficultyActivitySelectPageState extends WidgetEventObserver<DifficultyActivitySelectPage> {
  DifficultyActivitySelectPageViewModel viewModel = DifficultyActivitySelectPageViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HelldiversBackground(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(tr("_helldivers_select_difficulty"),
            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      Expanded(child: _buildDifficultiesList()),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: HelldiversTextButton(text: tr("_back"), onClick: () => Navigator.pop(context))),
    ])));
  }

  Widget _buildDifficultiesList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: List.generate(Difficulties.values.length, (int index) {
                    Difficulties difficulty = Difficulties.values[index];
                    return DifficultyButton(
                      onClick: () => viewModel.onDifficultyClick(difficulty),
                      difficulty: difficulty,
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
