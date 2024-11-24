import 'package:flutter/material.dart';
import 'package:rpc_express/components/common/atoms/colored_container.dart';
import 'package:rpc_express/model/class/games/game_object.dart';

class GameSelectionContainer extends StatefulWidget {
  final GameObject game;
  final Function(GameObject) onTap;

  const GameSelectionContainer({
    super.key,
    required this.game,
    required this.onTap,
  });

  @override
  State<GameSelectionContainer> createState() => _GameSelectionContainerState();
}

class _GameSelectionContainerState extends State<GameSelectionContainer> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => setState(() => hovered = true),
        onExit: (event) => setState(() => hovered = false),
        child: ColoredContainer(
          game: widget.game,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: _buildGamesRow(),
        ));
  }

  Widget _buildGamesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: GameObject.values.map((GameObject gameObject) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => widget.onTap(gameObject),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 400),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: 30,
                          child: Image.asset(
                            gameObject.icon,
                            fit: BoxFit.cover,
                          )),
                      AnimatedSize(
                          clipBehavior: Clip.hardEdge,
                          curve: hovered ? Curves.easeOutBack : Curves.ease,
                          duration: const Duration(milliseconds: 400),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 30),
                            child: hovered
                                ? Column(
                                    children: [
                                      const SizedBox(height: 6),
                                      Text(
                                        gameObject.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          )),
                    ],
                  ),
                  if (gameObject != GameObject.values.last) const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
