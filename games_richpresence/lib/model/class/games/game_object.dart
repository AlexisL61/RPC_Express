import 'package:flutter/material.dart';
import 'package:games_richpresence/components/common/atoms/colors/colors.dart';
import 'package:games_richpresence/gen/assets.gen.dart';
import 'package:games_richpresence/transformers/activity/activity_transformer.dart';
import 'package:games_richpresence/transformers/activity/sea_of_thieves/sea_of_thieves_activity_company_transformer.dart';

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
        return CommonColors.sotBackgroundDark;
    }
  }

  Color get gameBackgroundLightColor {
    switch (this) {
      case GameObject.seaOfThieves:
        return CommonColors.sotBackgroundLight;
    }
  }

  String get fontFamily {
    switch (this) {
      case GameObject.seaOfThieves:
        return "Windlass";
    }
  }

  ActivityTransformer get activityTransformer {
    switch (this) {
      case GameObject.seaOfThieves:
        return SeaOfThievesActivityCompanyTransformer();
    }
  }

  String get rpcClientId {
    switch (this) {
      case GameObject.seaOfThieves:
        return "992744165802782741";
    }
  }
}
