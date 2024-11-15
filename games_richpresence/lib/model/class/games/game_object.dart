import 'package:flutter/material.dart';
import 'package:games_richpresence/components/common/atoms/colors/colors.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/transformers/activity/activity_transformer.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_company_transformer.dart';
import 'package:games_richpresence/transformers/activity/the_finals/the_finals_gamemode_category_transformer.dart';

enum GameObject {
  seaOfThieves("sea_of_thieves", "Sea of Thieves", "Windlass", "992744165802782741"),
  theFinals("the_finals", "The Finals", "Poppins", "1277334180354723980"),
  helldivers("helldivers", "Helldivers 2", "ChakraPetch", "1277334180354723980");

  final String id;
  final String name;
  final String fontFamily;
  final String rpcClientId;

  const GameObject(this.id, this.name, this.fontFamily, this.rpcClientId);
}

extension GameObjectExtension on GameObject {
  String get icon {
    switch (this) {
      case GameObject.seaOfThieves:
        return Assets.common.icons.seaOfThievesIcon.path;
      case GameObject.theFinals:
        return Assets.common.icons.theFinalsIcon.path;
      case GameObject.helldivers:
        return Assets.common.icons.helldiversIcon.path;
    }
  }

  Color get gameSelectionBackgroundColor {
    switch (this) {
      case GameObject.seaOfThieves:
        return CommonColors.sotBackgroundDark;
      case GameObject.theFinals:
        return CommonColors.theFinalsBackgroundDark;
      case GameObject.helldivers:
        return CommonColors.sotBackgroundDark;
    }
  }

  Color get gameBackgroundLightColor {
    switch (this) {
      case GameObject.seaOfThieves:
        return CommonColors.sotBackgroundLight;
      case GameObject.theFinals:
        return CommonColors.theFinalsBackgroundLight;
      case GameObject.helldivers:
        return CommonColors.sotBackgroundLight;
    }
  }

  ActivityTransformer get activityTransformer {
    switch (this) {
      case GameObject.seaOfThieves:
        return SeaOfThievesActivityCompanyTransformer();
      case GameObject.theFinals:
        return TheFinalsGamemodeCategoryTransformer();
      case GameObject.helldivers:
        return TheFinalsGamemodeCategoryTransformer();
    }
  }
}
