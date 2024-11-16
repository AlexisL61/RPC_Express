import 'package:games_richpresence/gen/assets.gen.dart';

enum HelldiversObjective {
  defense("defense"),
  liberation("liberation"),
  unknown("unknown");

  final String value;

  const HelldiversObjective(this.value);
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

