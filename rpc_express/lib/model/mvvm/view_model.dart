import 'package:rpc_express/model/mvvm/widget_event_observer.dart';
import 'package:rpc_express/model/mvvm/view_event.dart';
import 'package:rpc_express/model/mvvm/view_events/update_view_event.dart';

abstract class EventViewModel {
  late EventObserver? _widgetObserver = null;

  void subscribe(EventObserver o) {
    _widgetObserver = o;
  }

  bool unsubscribe(EventObserver o) {
    if (_widgetObserver == o) {
      _widgetObserver = null;
      return true;
    }
    return false;
  }

  Future<dynamic> notify([ViewEvent event = const UpdateViewEvent()]) async {
    if (_widgetObserver != null) {
      return await _widgetObserver?.notify(event);
    }
    return null;
  }
}
