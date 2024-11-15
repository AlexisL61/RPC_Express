import 'package:flutter/material.dart';
import 'package:games_richpresence/components/helldivers/background/background.dart';
import 'package:games_richpresence/model/class/user_data/user_data.dart';
import 'package:games_richpresence/model/mvvm/widget_event_observer.dart';
import 'package:games_richpresence/pages/helldivers/home/home_page_view_model.dart';

class HelldiversHomePage extends StatefulWidget {
  final Function(UserData) updateRpc;
  const HelldiversHomePage({super.key, required this.updateRpc});

  @override
  State<HelldiversHomePage> createState() => _HelldiversHomePageState();
}

class _HelldiversHomePageState extends WidgetEventObserver<HelldiversHomePage> {
  late HelldiversHomePageViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = HelldiversHomePageViewModel(updateRpc: widget.updateRpc);
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return HelldiversBackground(
        child: Column(
      children: [],
    ));
  }
}
