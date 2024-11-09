import 'package:flutter/material.dart';
import 'package:games_richpresence/model/mvvm/view_event.dart';

/// Event to push a new route to the ui
class PushRouteEvent extends ViewEvent {
  const PushRouteEvent(this.route, {this.arguments, this.onResult});

  /// The route to push
  final String route;

  /// The arguments to pass to the route
  final dynamic arguments;

  /// The callback to call when the route is popped
  final void Function(dynamic)? onResult;

  @override
  void execute(context) {
    Navigator.of(context).pushNamed(route, arguments: arguments).then((value) {
      onResult?.call(value);
    });
  }
}
