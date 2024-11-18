import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpc_express/gen/assets.gen.dart';

class TheFinalsTitle extends StatelessWidget {
  final String title;
  const TheFinalsTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image(image: AssetImage(Assets.common.icons.theFinalsIcon.path), height: 30),
          SizedBox(width: 10),
          Text(title.toUpperCase(),
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
