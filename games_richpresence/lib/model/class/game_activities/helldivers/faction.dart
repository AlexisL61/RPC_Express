import 'package:flutter/material.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

enum HelldiversFactions {
  humans,
  terminids,
  automatons;

  static HelldiversFactions fromString(String faction) {
    switch (faction) {
      case 'Humans':
        return HelldiversFactions.humans;
      case 'Terminids':
        return HelldiversFactions.terminids;
      case 'Automatons':
        return HelldiversFactions.automatons;
    }
    throw Exception('Unknown faction: $faction');
  }
}

extension HelldiversFactionsExtension on HelldiversFactions {
  String get icon {
    switch (this) {
      case HelldiversFactions.humans:
        return Assets.helldivers.images.superhearthIcon.path;
      case HelldiversFactions.terminids:
        return Assets.helldivers.images.terminidIcon.path;
      case HelldiversFactions.automatons:
        return Assets.helldivers.images.automatonIcon.path;
    }
  }

  Color get color {
    switch (this) {
      case HelldiversFactions.humans:
        return const Color(0xFFa7daeb);
      case HelldiversFactions.terminids:
        return const Color(0xFFfe6d72);
      case HelldiversFactions.automatons:
        return const Color(0xFFffc100);
    }
  }
}
