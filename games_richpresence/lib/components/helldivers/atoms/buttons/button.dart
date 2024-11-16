import 'package:flutter/widgets.dart';
import 'package:games_richpresence/gen/assets.gen.dart';

class HelldiversButton extends StatefulWidget {
  final String text;
  final Function onClick;

  const HelldiversButton({super.key, required this.text, required this.onClick});

  @override
  State<HelldiversButton> createState() => _HelldiversButtonState();
}

class _HelldiversButtonState extends State<HelldiversButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onClick();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 1),
            border: Border.all(
              color: Color(0xFF30302f),
              width: 2,
            ),
            image: DecorationImage(
                image: AssetImage(Assets.helldivers.buttons.buttonBackground.path), repeat: ImageRepeat.repeat),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
