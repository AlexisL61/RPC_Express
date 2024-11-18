import 'package:flutter/widgets.dart';
import 'package:rpc_express/components/helldivers/atoms/buttons/button.dart';

class HelldiversTextButton extends StatelessWidget {
  final String text;
  final Function onClick;
  const HelldiversTextButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return HelldiversButton(
        child: Text(
          text,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onClick: onClick);
  }
}
