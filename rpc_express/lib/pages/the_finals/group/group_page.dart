import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/the_finals/molecules/navigation/navigation_view.dart';
import 'package:rpc_express/components/the_finals/molecules/title/title.dart';
import 'package:rpc_express/components/the_finals/organisms/player_group.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/the_finals/group/group_page_view_model.dart';

class TheFinalsGroupPage extends StatefulWidget {
  static const String route = '/the_finals/group';

  const TheFinalsGroupPage({super.key});

  @override
  State<TheFinalsGroupPage> createState() => _TheFinalsGroupPageState();
}

class _TheFinalsGroupPageState extends WidgetEventObserver<TheFinalsGroupPage> {
  TheFinalsGroupPageViewModel viewModel = TheFinalsGroupPageViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return TheFinalsNavigationView(
        content: Column(
      children: [
        TheFinalsTitle(title: tr("_the_finals_select_players_number")),
        Expanded(
          child: TheFinalsChoosePlayerGroup(
            onPlayerGroupSelected: viewModel.onPlayerNumberSelected,
          ),
        )
      ],
    ));
  }
}
