import 'package:flutter/material.dart';
import 'package:games_richpresence/components/the_finals/atoms/colors/colors.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class TheFinalsLargePanel extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final Function() onTap;

  const TheFinalsLargePanel(
      {super.key, required this.title, required this.description, required this.image, required this.onTap});

  @override
  State<TheFinalsLargePanel> createState() => _TheFinalsLargePanelState();
}

class _TheFinalsLargePanelState extends State<TheFinalsLargePanel> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovered ? 0 : 0.3),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(isHovered ? 1 : 0), width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: AspectRatio(
                  aspectRatio: 0.75,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(widget.image, fit: BoxFit.fitHeight),
                          Align(
                            widthFactor: 1,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              color: TheFinalsColors.buttonDescriptionBackground,
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                              child: Text(widget.description,
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ],
                      )),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              color: TheFinalsColors.buttonTitleBackground,
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                widget.title.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
