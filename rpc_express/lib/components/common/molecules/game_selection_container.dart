import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 50,
      decoration: BoxDecoration(
          color: widget.game.gameSelectionBackgroundColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: _buildGamesRow(),
    );
  }

  Widget _buildGamesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: GameObject.values.map((GameObject gameObject) {
        return GestureDetector(
          onTap: () => widget.onTap(gameObject),
          child: Row(
            children: [
              Container(
                child: Image.asset(gameObject.icon),
              ),
              if (gameObject != GameObject.values.last) SizedBox(width: 10),
            ],
          ),
        );
      }).toList(),
    );
  }
}
