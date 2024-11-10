import 'package:flutter/material.dart';
import 'package:games_richpresence/components/common/molecules/game_selection_container.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/home/home_view_model.dart';
import 'package:games_richpresence/pages/home/loading/game_loading.dart';
import 'package:games_richpresence/pages/sea_of_thieves/home/home_page.dart';

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
        viewModel.isLoadingGame
            ? GameLoadingPage(gameObject: viewModel.selectedGame)
            : SeaOfThievesHomePage(
                updateRpc: viewModel.updateRpc,
              ),
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
}
