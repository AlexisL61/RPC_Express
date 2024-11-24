import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rpc_express/components/common/atoms/colored_container.dart';
import 'package:rpc_express/components/common/organisms/discord_container_view_model.dart';
import 'package:rpc_express/gen/assets.gen.dart';
import 'package:rpc_express/model/class/games/game_object.dart';
import 'package:rpc_express/model/mvvm/widget_event_observer.dart';

class DiscordContainer extends StatefulWidget {
  final GameObject game;
  const DiscordContainer({super.key, required this.game});

  @override
  State<DiscordContainer> createState() => _DiscordContainerState();
}

class _DiscordContainerState extends WidgetEventObserver<DiscordContainer> {
  bool hovered = false;
  DiscordContainerViewModel viewModel = DiscordContainerViewModel();

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
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
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
    return SizedBox(
        width: 50,
        height: 20,
        child: SvgPicture.asset(Assets.common.icons.discord,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)));
  }

  Widget _buildExpanded() {
    if (viewModel.userData == null) {
      return _buildExpandedUnknown();
    } else {
      return _buildExpandedKnown();
    }
  }

  Widget _buildExpandedUnknown() {
    return SizedBox(
      width: 200,
      child: Column(children: [
        Text(
          tr("_app_rich_presence"),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          tr("_app_rich_presence_unknown"),
          style: TextStyle(color: Colors.white),
        ),
      ]),
    );
  }

  Widget _buildExpandedKnown() {
    return Column(
      children: [
        Text(
          tr("_app_rich_presence"),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            if (viewModel.userData!.getRpcLargeImageKey() != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Image.network(
                    viewModel.userData!.getRpcLargeImageKey()!,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fitHeight,
                  ),
                  color: const Color.fromARGB(255, 31, 31, 36),
                ),
              ),
            if (viewModel.userData!.getRpcLargeImageKey() != null) SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (viewModel.userData!.getRpcDetails() != null)
                  Text(
                    viewModel.userData!.getRpcDetails()!,
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                if (viewModel.userData!.getRpcState() != null)
                  Text(viewModel.userData!.getRpcState()!, style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
