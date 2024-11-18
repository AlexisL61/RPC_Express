import 'package:flutter/material.dart';
import 'package:rpc_express/model/mvvm/view_event.dart';

/// Event to push a new route to the ui
class PushRouteEvent extends ViewEvent {
  const PushRouteEvent(this.route, {this.arguments});

  /// The route to push
  final String route;

  /// The arguments to pass to the route
  final dynamic arguments;

  @override
  Future<dynamic> execute(context) async {
    return await Navigator.of(context).pushNamed(route, arguments: arguments);
  }
}
