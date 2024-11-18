import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/sea_of_thieves/atoms/buttons/ship_button.dart';
import 'package:rpc_express/components/sea_of_thieves/atoms/navigation/naviagtion_view.dart';
import 'package:rpc_express/components/sea_of_thieves/atoms/separator/separator.dart';
import 'package:rpc_express/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:rpc_express/gen/assets.gen.dart';
import 'package:rpc_express/model/class/user_group/sea_of_thieves/ship.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/sea_of_thieves/ships/choose_ship_view_model.dart';

class ChooseShip extends StatefulWidget {
  static const route = "/sea_of_thieves/choose_ship";

  const ChooseShip({super.key});

  @override
  State<ChooseShip> createState() => _ChooseShipState();
}

class _ChooseShipState extends WidgetEventObserver<ChooseShip> {
  late ChooseShipViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ChooseShipViewModel();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return SotNavigationView(
        showBackButton: true,
        content: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(tr("_sot_choose_your_ship"), style: SotTextStyles.mediumWhite),
            SizedBox(height: 20),
            SeaOfThievesSeparator(icon: Assets.seaOfThieves.icons.sloop),
            SizedBox(height: 40),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    SeaOfThievesShip.ships.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShipButton(
                              onPressed: () async {
                                viewModel.onShipSelected(SeaOfThievesShip.ships[index]);
                              },
                              ship: SeaOfThievesShip.ships[index]),
                        ))),
          ],
        )));
  }
}
