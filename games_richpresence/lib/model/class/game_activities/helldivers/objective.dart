import 'package:games_richpresence/gen/assets.gen.dart';

enum HelldiversObjective {
  defense("defense", "_helldivers_objective_defense"),
  liberation("liberation", "_helldivers_objective_liberation"),
  unknown("unknown", "_helldivers_objective_unknown");

  final String value;
  final String name;

  const HelldiversObjective(this.value, this.name);
}

extension HelldiversObjectiveExtension on HelldiversObjective {
  String get icon {
    switch (this) {
      case HelldiversObjective.defense:
        return Assets.helldivers.images.defenseIcon.path;
      case HelldiversObjective.liberation:
        return Assets.helldivers.images.liberationIcon.path;
      case HelldiversObjective.unknown:
        return Assets.helldivers.images.defenseIcon.path;
    }
  }
}
