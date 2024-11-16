import 'package:flutter/material.dart';
import 'package:games_richpresence/components/helldivers/atoms/background/background.dart';
import 'package:games_richpresence/components/helldivers/molecules/panels/large_panel.dart';
import 'package:games_richpresence/components/helldivers/molecules/panels/planet_panel.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/faction.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/planets.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/helldivers/home/home_page_view_model.dart';

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
        child: Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        HelldiversLargePanel(
          title: "HELLDIVER'S TEAM",
          subtitle: "SUPEREARTH FORCE",
          description: "Liberate the galaxy by sharing how many helldivers are in your destroyer",
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
        HelldiversLargePanel(
          title: "GALACTIC MAP",
          subtitle: "SUPEREARTH GALAXY",
          description: "Select the region where you are currently fighting",
          icon: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xFF3F3F3F)),
            child: Image.asset(Assets.helldivers.images.flag.path),
          ),
          child: Wrap(
            children: _buildDiversCount(),
          ),
        ),
        HelldiversPlanetPanel(
            planet: HelldiversPlanet(
                id: 145,
                name: "GAELLIVARE",
                sector: "Talus",
                biomeImage: "",
                position: Position(x: 0.5, y: 0.5),
                owner: HelldiversFactions.terminids))
      ],
    ));
  }

  List<Widget> _buildDiversCount() {
    return List.generate(4, (index) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            viewModel.onGroupClicked(index);
          },
          child: Container(
            margin: EdgeInsets.only(right: 8, top: 8),
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: Color(0xFF3F3F3F)),
            child: Opacity(
                opacity: viewModel.userData.group != null && viewModel.userData.group!.groupSize >= index ? 1 : 0.2,
                child: Image.asset(Assets.helldivers.images.helldiverDecorated.path)),
          ),
        ),
      );
    });
  }
}
