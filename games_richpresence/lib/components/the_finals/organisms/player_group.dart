import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:games_richpresence/components/the_finals/molecules/panels/small_panel.dart';
import 'package:games_richpresence/model/class/user_group/the_finals/group.dart';

class TheFinalsChoosePlayerGroup extends StatelessWidget {
  final Function(TheFinalsGroup) onPlayerGroupSelected;

  const TheFinalsChoosePlayerGroup({super.key, required this.onPlayerGroupSelected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TheFinalsSmallPanel(
              title: plural("_number_of_players", index + 1),
              panelContent: (index + 1).toString(),
              onTap: () {
                onPlayerGroupSelected(TheFinalsGroup(groupSize: index + 1));
              }),
        );
      }),
    );
  }
}
