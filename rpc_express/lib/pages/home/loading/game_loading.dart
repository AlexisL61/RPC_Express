import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/model/class/games/game_object.dart';

class GameLoadingPage extends StatefulWidget {
  final GameObject gameObject;

  const GameLoadingPage({super.key, required this.gameObject});

  @override
  State<GameLoadingPage> createState() => _GameLoadingPageState();
}

class _GameLoadingPageState extends State<GameLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.gameObject.gameSelectionBackgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: widget.gameObject.gameBackgroundLightColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ]),
              child: Image.asset(widget.gameObject.icon),
            ),
            SizedBox(height: 20),
            Text(
              'Loading ${widget.gameObject.name}...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
