import 'package:flutter/material.dart';
import 'package:games_richpresence/components/common/atoms/colors/colors.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

enum GameObject {
  seaOfThieves("sea_of_thieves");

  final String id;

  const GameObject(this.id);
}

extension GameObjectExtension on GameObject {
  String get name {
    switch (this) {
      case GameObject.seaOfThieves:
        return "Sea of Thieves";
    }
  }

  String get icon {
    switch (this) {
      case GameObject.seaOfThieves:
        return Assets.common.icons.seaOfThievesIcon.path;
    }
  }

  Color get gameSelectionBackgroundColor {
    switch (this) {
      case GameObject.seaOfThieves:
        return CommonColors.gameSelectSotBackground;
    }
  }
}
