import 'package:flutter/material.dart';
import 'package:rpc_express/model/mvvm/view_event.dart';
import 'package:rpc_express/model/mvvm/view_events/update_view_event.dart';

/// Base class for all event observers.
abstract class EventObserver {
  Future<dynamic> notify(ViewEvent event);
}

abstract class WidgetEventObserver<T extends StatefulWidget> extends State<T> implements EventObserver {
  WidgetEventObserver();

  @override
  Future<dynamic> notify(ViewEvent event) async {
    if (event is UpdateViewEvent) {
      setState(() {});
      return;
    }
    return await event.execute(context);
  }
}
