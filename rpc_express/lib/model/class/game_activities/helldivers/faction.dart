import 'package:flutter/material.dart';
import 'package:rpc_express/gen/assets.gen.dart';

enum HelldiversFactions {
  humans(name: "Humans"),
  terminids(name: "Terminids"),
  automatons(name: "Automaton"),
  unknown(name: "Unknown");

  final String name;

  const HelldiversFactions({required this.name});

  static HelldiversFactions fromString(String faction) {
    switch (faction) {
      case 'Humans':
        return HelldiversFactions.humans;
      case 'Terminids':
        return HelldiversFactions.terminids;
      case 'Automaton':
        return HelldiversFactions.automatons;
      case 'Unknown':
        return HelldiversFactions.unknown;
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
      case HelldiversFactions.unknown:
        return Assets.helldivers.images.superhearthIcon.path;
    }
  }

  Color get color {
    switch (this) {
      case HelldiversFactions.humans:
        return const Color(0xFF6bb7ea);
      case HelldiversFactions.automatons:
        return const Color(0xFFfe6d72);
      case HelldiversFactions.terminids:
        return const Color(0xFFffc100);
      case HelldiversFactions.unknown:
        return const Color.fromARGB(255, 182, 182, 182);
    }
  }
}
