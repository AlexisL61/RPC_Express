import 'package:flutter/widgets.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/faction.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/planets.dart';

class HelldiversPlanetPanel extends StatelessWidget {
  final HelldiversPlanet planet;

  const HelldiversPlanetPanel({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          border: Border.all(
            color: Color(0xFFc9c9cb),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image(image: AssetImage(planet.owner.icon), width: 70, height: 70),
                SizedBox(width: 20),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      planet.name,
                      style: TextStyle(
                        color: planet.owner.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      planet.sector,
                      style: TextStyle(
                        color: planet.owner.color,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
                Image.network(
                  planet.biomeImage,
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 400,
                    height: 200,
                    color: Color(0xFF3F3F3F),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
