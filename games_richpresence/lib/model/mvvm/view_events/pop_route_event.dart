import 'package:flutter/material.dart';
import 'package:games_richpresence/model/mvvm/view_event.dart';

/// Event to pop the current route.
class PopRouteEvent extends ViewEvent {
  const PopRouteEvent();

  @override
  void execute(context) {
    Navigator.of(context).pop();
  }
}
