import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/the_finals/molecules/navigation/navigation_view.dart';
import 'package:rpc_express/components/the_finals/molecules/panels/large_panel.dart';
import 'package:rpc_express/components/the_finals/molecules/title/title.dart';
import 'package:rpc_express/model/class/game_activities/the_finals/gamemode_category.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/pages/the_finals/gamemodes/gamemodes_categories_page_view_model.dart';

class TheFinalsGamemodesCategoriesPage extends StatefulWidget {
  static const String route = "/the_finals/gamemodes";

  const TheFinalsGamemodesCategoriesPage({super.key});

  @override
  State<TheFinalsGamemodesCategoriesPage> createState() => _TheFinalsGamemodesCategoriesPageState();
}

class _TheFinalsGamemodesCategoriesPageState extends WidgetEventObserver<TheFinalsGamemodesCategoriesPage> {
  TheFinalsGamemodesCategoriesPageViewModel viewModel = TheFinalsGamemodesCategoriesPageViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return TheFinalsNavigationView(
        content: Column(
      children: [TheFinalsTitle(title: tr("_the_finals_select_gamemode")), Expanded(child: _buildCategories())],
    ));
  }

  Widget _buildCategories() {
    String Function(String) onlineTranslate = viewModel.translationService.onlineTranslate;
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: List.generate(viewModel.gamemodeCategories.length, (index) {
              TheFinalsGamemodeCategory category = viewModel.gamemodeCategories[index];
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TheFinalsLargePanel(
                      title: onlineTranslate(category.name),
                      description: onlineTranslate(category.description),
                      image: category.image,
                      onTap: () {
                        viewModel.onCategorySelected(category);
                      }));
            }),
          )
        ],
      ),
    );
  }
}
