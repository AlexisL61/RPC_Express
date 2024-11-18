import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rpc_express/components/sea_of_thieves/atoms/background/background.dart';
import 'package:rpc_express/gen/assets.gen.dart';

class SotNavigationView extends StatefulWidget {
  final Widget content;
  final bool showBackButton;

  const SotNavigationView({super.key, required this.content, this.showBackButton = false});

  @override
  State<SotNavigationView> createState() => _SotNavigationViewState();
}

class _SotNavigationViewState extends State<SotNavigationView> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SotBackground(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.content,
            ),
            if (widget.showBackButton)
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      isHovering = true;
                      setState(() {});
                    },
                    onExit: (event) {
                      isHovering = false;
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      isHovering ? Assets.seaOfThieves.icons.closeHover : Assets.seaOfThieves.icons.close,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
