import 'package:flutter/widgets.dart';

class HelldiversLargePanel extends StatelessWidget {
  final Color? borderColor;
  final String title;
  final String subtitle;
  final Widget? icon;
  final Widget? child;
  final String description;

  const HelldiversLargePanel(
      {super.key,
      this.borderColor,
      required this.title,
      required this.subtitle,
      this.icon,
      this.child,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.8),
        border: Border.all(
          color: borderColor ?? Color(0xFF30302f),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) icon!,
                if (icon != null) SizedBox(width: 20),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Color.fromRGBO(120, 120, 116, 1),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(height: 10),
            Text(description,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16,
                )),
            if (child != null) SizedBox(height: 20),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
