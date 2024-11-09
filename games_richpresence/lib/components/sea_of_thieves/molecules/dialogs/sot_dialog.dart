import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class SOTDialog extends StatefulWidget {
  final Widget child;

  const SOTDialog({super.key, required this.child});

  @override
  State<SOTDialog> createState() => _SOTDialogState();
}

class _SOTDialogState extends State<SOTDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Positioned.fill(
                child: SvgPicture.asset(
                  Assets.seaOfThieves.svg.background.popUpBackground,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                    clipBehavior: Clip.hardEdge)),
            Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [widget.child],
                ))
          ])
        ]);
  }
}
