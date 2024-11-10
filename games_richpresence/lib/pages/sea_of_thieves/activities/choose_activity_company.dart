import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/responsive/responsive_data.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/separator/separator.dart';
import 'package:games_richpresence/components/sea_of_thieves/atoms/texts/styles.dart';
import 'package:games_richpresence/components/sea_of_thieves/molecules/activities/activity_company_widget.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/sea_of_thieves/activities/choose_activity_company_view_model.dart';

import '../../../components/sea_of_thieves/atoms/navigation/naviagtion_view.dart';

class ChooseActivityCompanyPage extends StatefulWidget {
  static const route = "/sea_of_thieves/choose_activity_company";

  const ChooseActivityCompanyPage({super.key});

  @override
  State<ChooseActivityCompanyPage> createState() => _ChooseActivityCompanyPageState();
}

class _ChooseActivityCompanyPageState extends WidgetEventObserver<ChooseActivityCompanyPage> {
  ChooseActivityCompanyViewModel viewModel = ChooseActivityCompanyViewModel();

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
              Text(tr("_company_select_title"), style: SotTextStyles.mediumWhite),
              SizedBox(height: 20),
              Separator(icon: Assets.seaOfThieves.icons.sloop),
              SizedBox(height: 40),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: ResponsiveData.getPadding(MediaQuery.of(context).size.width, ratio: 1.5)),
                  child: GridView.count(
                      childAspectRatio: 2,
                      crossAxisCount: ResponsiveData.getColumns(MediaQuery.of(context).size.width, ratio: 1.5),
                      children: List.generate(viewModel.activityCompanies.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                              onTap: () async {
                                viewModel.onActivityCompanySelected(viewModel.activityCompanies[index]);
                                // Navigator.pop(
                                //     context,
                                //     await Navigator.pushNamed(context, '/choose_activity',
                                //         arguments: ActivityService.activityCategories[index]) as Activity?);
                              },
                              child: CompanyWidget(company: viewModel.activityCompanies[index], onlineTr: viewModel.translationService.onlineTranslate)),
                        );
                      })),
                ),
              ),
            ],
          ),
        ));
  }
}
