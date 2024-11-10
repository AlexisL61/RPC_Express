import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/buttons/small_button.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/navigation/naviagtion_view.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/separator/separator.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/user_group/sea_of_thieves/ship.dart';

class ChooseShipPlayerRoute extends StatelessWidget {
  static const route = "/sea_of_thieves/choose_ship_players";

  const ChooseShipPlayerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    SeaOfThievesShip selectedShip = ModalRoute.of(context)!.settings.arguments as SeaOfThievesShip;
    return ChooseShipPlayersPage(selectedShip: selectedShip);
  }
}

class ChooseShipPlayersPage extends StatefulWidget {
  final SeaOfThievesShip selectedShip;
  const ChooseShipPlayersPage({super.key, required this.selectedShip});

  @override
  State<ChooseShipPlayersPage> createState() => _ChooseShipPlayersPageState();
}

class _ChooseShipPlayersPageState extends State<ChooseShipPlayersPage> {
  @override
  Widget build(BuildContext context) {
    return SotNavigationView(
        showBackButton: true,
        content: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(tr("_choose_player_number"), style: SotTextStyles.mediumWhite),
            SizedBox(height: 20),
            Separator(icon: Assets.seaOfThieves.icons.sloop),
            SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: _buildPlayersChoice()),
          ],
        )));
  }

  List<Widget> _buildPlayersChoice() {
    List<Widget> players = [];
    for (int i = 1; i <= widget.selectedShip.maxPlayers; i++) {
      players.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmallButton(
              onPressed: () {
                Navigator.pop(context, i);
              },
              text: plural("_number_of_players", i))));
    }
    return players;
  }
}
