import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/helldivers/atoms/buttons/button.dart';
import 'package:rpc_express/model/class/game_activities/helldivers/difficulties.dart';

class DifficultyButton extends StatefulWidget {
  final Difficulties difficulty;
  final Function onClick;
  const DifficultyButton({super.key, required this.difficulty, required this.onClick});

  @override
  State<DifficultyButton> createState() => _DifficultyButtonState();
}

class _DifficultyButtonState extends State<DifficultyButton> {
  @override
  Widget build(BuildContext context) {
    return HelldiversButton(
        onClick: () {
          widget.onClick();
        },
        child: Container(
          height: 30,
          width: 300,
          child: Row(
            children: [
              SizedBox(width: 100, child: Image.asset(widget.difficulty.icon)),
              SizedBox(width: 20),
              Text(tr(widget.difficulty.name),
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }
}
