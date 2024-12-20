import 'package:flutter/material.dart';
import 'package:rpc_express/model/mvvm/view_event.dart';

/// Event to pop the current route.
class PopRouteEvent extends ViewEvent {
  const PopRouteEvent({this.arguments});

  final dynamic arguments;

  @override
  void execute(context) {
    Navigator.of(context).pop(arguments);
  }
}
