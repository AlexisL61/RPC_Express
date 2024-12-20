import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/helldivers/atoms/background/background.dart';
import 'package:rpc_express/components/helldivers/atoms/buttons/text_button.dart';
import 'package:rpc_express/components/helldivers/molecules/panels/planet_panel.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/helldivers/activity_select/planet_select_page_view_model.dart';

class HelldiversPlanetSelectPage extends StatefulWidget {
  static const route = '/helldivers/activity_select';

  const HelldiversPlanetSelectPage({super.key});

  @override
  State<HelldiversPlanetSelectPage> createState() => _HelldiversPlanetSelectPageState();
}

class _HelldiversPlanetSelectPageState extends WidgetEventObserver<HelldiversPlanetSelectPage> {
  HelldiversPlanetSelectPageViewModel viewModel = HelldiversPlanetSelectPageViewModel();

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
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(tr("_helldivers_select_planet"),
              style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        Expanded(child: _buildPlanetList()),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: HelldiversTextButton(text: tr("_back"), onClick: () => Navigator.pop(context))),
      ],
    )));
  }

  Widget _buildPlanetList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Wrap(
            spacing: 40,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(viewModel.planets.length, (int index) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => viewModel.onPlanetClick(viewModel.planets[index]),
                  child: HelldiversPlanetPanel(
                    planet: viewModel.planets[index],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
