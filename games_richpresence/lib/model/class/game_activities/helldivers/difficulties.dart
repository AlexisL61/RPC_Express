import 'package:games_richpresence/gen/assets.gen.dart';

enum Difficulties {
  trivial("trivial", 1),
  easy("easy", 2),
  medium("medium", 3),
  challenging("challenging", 4),
  hard("hard", 5),
  extreme("extreme", 6),
  suicide("suicide", 7),
  impossible("impossible", 8),
  helldive("helldive", 9),
  super_helldive("super_helldive", 10);

  final String id;
  final int level;

  const Difficulties(this.id, this.level);
}

extension DifficultiesExtension on Difficulties {
  String get icon {
    switch (this) {
      case Difficulties.trivial:
        return Assets.helldivers.images.difficulties.trivial.path;
      case Difficulties.easy:
        return Assets.helldivers.images.difficulties.easy.path;
      case Difficulties.medium:
        return Assets.helldivers.images.difficulties.medium.path;
      case Difficulties.challenging:
        return Assets.helldivers.images.difficulties.challenging.path;
      case Difficulties.hard:
        return Assets.helldivers.images.difficulties.hard.path;
      case Difficulties.extreme:
        return Assets.helldivers.images.difficulties.extreme.path;
      case Difficulties.suicide:
        return Assets.helldivers.images.difficulties.suicide.path;
      case Difficulties.impossible:
        return Assets.helldivers.images.difficulties.impossible.path;
      case Difficulties.helldive:
        return Assets.helldivers.images.difficulties.helldive.path;
      case Difficulties.super_helldive:
        return Assets.helldivers.images.difficulties.superHelldive.path;

    }
  }
}
