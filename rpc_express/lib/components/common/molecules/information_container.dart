import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/common/atoms/colored_container.dart';
import 'package:rpc_express/components/common/molecules/information_container_view_model.dart';
import 'package:rpc_express/model/class/games/game_object.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';

class InformationContainer extends StatefulWidget {
  final GameObject game;

  const InformationContainer({super.key, required this.game});

  @override
  State<InformationContainer> createState() => _InformationContainerState();
}

class _InformationContainerState extends WidgetEventObserver<InformationContainer> {
  bool hovered = false;
  InformationContainerViewModel viewModel = InformationContainerViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => hovered = true),
      onExit: (event) => setState(() => hovered = false),
      child: ColoredContainer(
        game: widget.game,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: AnimatedCrossFade(
            sizeCurve: hovered ? Curves.easeOutBack : Curves.ease,
            crossFadeState: hovered ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: hovered ? Duration(milliseconds: 400) : Duration(milliseconds: 300),
            firstChild: _buildDefault(),
            secondChild: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: _buildExpanded())),
      ),
    );
  }

  Widget _buildDefault() {
    return SizedBox(width: 30, height: 30, child: Icon(Icons.info, color: Colors.white, size: 30));
  }

  Widget _buildExpanded() {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                tr("_app_title"),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(width: 10),
              Text(
                viewModel.packageVersion,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(tr("_app_description"), style: TextStyle(color: Colors.grey.shade200, fontSize: 14)),
          const SizedBox(height: 10),
          Text(
              tr("_app_developer", namedArgs: {
                "developer": "AlexisL61",
              }),
              style: TextStyle(color: Colors.grey.shade200, fontSize: 14)),
          const SizedBox(height: 10),
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      viewModel.openUrl("https://github.com/AlexisL61/RPC_Express");
                    },
                    child: Icon(Icons.code, color: Colors.grey.shade200, size: 30)),
              ),
              const SizedBox(width: 5),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      viewModel.openUrl("https://github.com/sponsors/AlexisL61");
                    },
                    child: Icon(Icons.favorite, color: Colors.grey.shade200, size: 30)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
