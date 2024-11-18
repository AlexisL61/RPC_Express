import 'package:flutter/material.dart';
import 'package:rpc_express/components/common/molecules/game_selection_container.dart';
import 'package:rpc_express/model/class/games/game_object.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/helldivers/home/home_page.dart';
import 'package:rpc_express/pages/home/home_view_model.dart';
import 'package:rpc_express/pages/home/loading/game_loading.dart';
import 'package:rpc_express/pages/sea_of_thieves/home/home_page.dart';
import 'package:rpc_express/pages/the_finals/home/home_page.dart';

class HomePage extends StatefulWidget {
  final String language;
  final Function(String) setFontFamily;
  const HomePage({super.key, required this.language, required this.setFontFamily});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends WidgetEventObserver<HomePage> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(language: widget.language, setFontFamily: widget.setFontFamily);
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        _buildGamePage(),
        _buildGameList(),
      ]),
    );
  }

  Widget _buildGameList() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameSelectionContainer(game: viewModel.selectedGame, onTap: viewModel.changeGame),
        ],
      ),
    );
  }

  Widget _buildGamePage(){
    if (viewModel.isLoadingGame){
      return GameLoadingPage(gameObject: viewModel.selectedGame);
    } else {
      switch (viewModel.selectedGame){
        case GameObject.seaOfThieves:
          return SeaOfThievesHomePage(updateRpc: viewModel.updateRpc);
        case GameObject.theFinals:
          return TheFinalsHomePage(updateRpc: viewModel.updateRpc);
        case GameObject.helldivers:
          return HelldiversHomePage(updateRpc: viewModel.updateRpc);
        default:
          return Container();
      }
    }
  }
}
