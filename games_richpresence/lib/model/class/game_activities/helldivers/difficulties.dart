import 'package:games_richpresence/gen/assets.gen.dart';

enum Difficulties {
  trivial("trivial", "_helldivers_difficulty_trivial", 1),
  easy("easy", "_helldivers_difficulty_easy", 2),
  medium("medium", "_helldivers_difficulty_medium", 3),
  challenging("challenging", "_helldivers_difficulty_challenging", 4),
  hard("hard", "_helldivers_difficulty_hard", 5),
  extreme("extreme", "_helldivers_difficulty_extreme", 6),
  suicide("suicide", "_helldivers_difficulty_suicide", 7),
  impossible("impossible", "_helldivers_difficulty_impossible", 8),
  helldive("helldive", "_helldivers_difficulty_helldive", 9),
  super_helldive("super_helldive", "_helldivers_difficulty_super_helldive", 10);

  final String id;
  final String name;
  final int level;

  const Difficulties(this.id, this.name, this.level);
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
