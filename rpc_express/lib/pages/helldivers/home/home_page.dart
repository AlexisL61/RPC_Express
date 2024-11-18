import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rpc_express/components/helldivers/atoms/background/background.dart';
import 'package:rpc_express/components/helldivers/molecules/panels/large_panel.dart';
import 'package:rpc_express/components/helldivers/molecules/panels/planet_panel.dart';
import 'package:rpc_express/gen/assets.gen.dart';
import 'package:rpc_express/model/class/user_data/user_data.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/helldivers/home/home_page_view_model.dart';

class HelldiversHomePage extends StatefulWidget {
  final Function(UserData) updateRpc;
  const HelldiversHomePage({super.key, required this.updateRpc});

  @override
  State<HelldiversHomePage> createState() => _HelldiversHomePageState();
}

class _HelldiversHomePageState extends WidgetEventObserver<HelldiversHomePage> {
  late HelldiversHomePageViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = HelldiversHomePageViewModel(updateRpc: widget.updateRpc);
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return HelldiversBackground(
        child: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              HelldiversLargePanel(
                title: tr("_helldivers_team_panel_title"),
                subtitle: tr("_helldivers_team_panel_subtitle"),
                description: tr("_helldivers_team_panel_description"),
                icon: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xFF3F3F3F)),
                  child: Image.asset(Assets.helldivers.images.helldiver.path),
                ),
                child: Wrap(
                  children: _buildDiversCount(),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => viewModel.onActivityClick(),
                  child: HelldiversLargePanel(
                      title: tr("_helldivers_map_panel_title"),
                      subtitle: tr("_helldivers_map_panel_subtitle"),
                      description: tr("_helldivers_map_panel_description"),
                      icon: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xFF3F3F3F)),
                        child: Image.asset(Assets.helldivers.images.flag.path),
                      ),
                      child: _buildActivitySelected()),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  List<Widget> _buildDiversCount() {
    return List.generate(4, (index) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            viewModel.onGroupClicked(index + 1);
          },
          child: Container(
            margin: EdgeInsets.only(right: 8, top: 8),
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: Color(0xFF3F3F3F)),
            child: Opacity(
                opacity: viewModel.userData.group != null && viewModel.userData.group!.groupSize > index ? 1 : 0.2,
                child: Image.asset(Assets.helldivers.images.helldiverDecorated.path)),
          ),
        ),
      );
    });
  }

  Widget _buildActivitySelected() {
    if (viewModel.userData.activity != null && viewModel.userData.activity!.planet != null) {
      return HelldiversPlanetPanel(
        planet: viewModel.userData.activity!.planet!,
        difficulty: viewModel.userData.activity!.difficulty,
        showObjectiveStats: false,
      );
    } else {
      return Container();
    }
  }
}
