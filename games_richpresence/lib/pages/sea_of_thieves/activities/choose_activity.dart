import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/navigation/naviagtion_view.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/separator/separator.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/components/sea_of_thieves/molecules/activities/activity_category_widget.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/class/game_activities/sea_of_thieves/activity_company.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/sea_of_thieves/activities/choose_activity_view_model.dart';

class ChooseActivityRoute extends StatelessWidget {
  static const route = "/sea_of_thieves/choose_activity";

  const ChooseActivityRoute({super.key});

  @override
  Widget build(BuildContext context) {
    SeaOfThievesActivityCompany company = ModalRoute.of(context)!.settings.arguments as SeaOfThievesActivityCompany;
    return ChooseActivityPage(company: company);
  }
}

class ChooseActivityPage extends StatefulWidget {
  final SeaOfThievesActivityCompany company;
  const ChooseActivityPage({super.key, required this.company});

  @override
  State<ChooseActivityPage> createState() => _ChooseActivityPageState();
}

class _ChooseActivityPageState extends WidgetEventObserver<ChooseActivityPage> {
  ChooseActivityViewModel viewModel = ChooseActivityViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return SotNavigationView(
        showBackButton: true,
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(tr("_activity_select_title"), style: SotTextStyles.mediumWhite),
              SizedBox(height: 20),
              SeaOfThievesSeparator(icon: Assets.seaOfThieves.icons.sloop),
              SizedBox(height: 40),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                      children: List.generate(widget.company.categories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ActivityCategoryWidget(
                        activityCategory: widget.company.categories[index],
                        onlineTr: viewModel.translationService.onlineTranslate,
                        onActivitySelected: viewModel.onActivitySelected,
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
        ));
  }
}
