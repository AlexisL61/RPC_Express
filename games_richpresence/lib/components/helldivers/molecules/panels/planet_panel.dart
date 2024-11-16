import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/faction.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/objective.dart';
import 'package:games_richpresence/model/class/game_activities/helldivers/planets.dart';

class HelldiversPlanetPanel extends StatelessWidget {
  final HelldiversPlanet planet;

  const HelldiversPlanetPanel({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:350,
      child: Column(
            children: [
              if (planet.objective != null)
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Image(image: AssetImage(planet.objective!.icon), width: 20, height: 20),
                      SizedBox(width: 10),
                      Text(
                        planet.objective!.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            border: Border.all(
              color: Color(0xFFffe702),
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      border: Border.all(
                        color: Color(0xFFc9c9cb),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(image: AssetImage(planet.owner.icon), width: 50, height: 50),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                planet.name,
                                style: TextStyle(
                                    color: planet.owner.color, fontSize: 20, fontWeight: FontWeight.w800, height: 1),
                              ),
                              Text(
                                planet.sector,
                                style: TextStyle(color: planet.owner.color, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))
                        ]),
                        Image.network(
                          planet.biomeImage,
                          width: 350,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 350,
                            height: 100,
                            color: Color(0xFF3F3F3F),
                          ),
                        ),
                      ],
                    ),
                  ),
              if (planet.objectiveProgression != null && planet.ennemy != null) SizedBox(height: 2),
              if (planet.objectiveProgression != null && planet.ennemy != null)
                Container(
                  width:350,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    border: Border.all(
                      color: planet.owner.color,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      SizedBox(width: 2),
                      Text(
                        (planet.objectiveProgression! * 100).toStringAsFixed(2) + "%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Container(
                          color: HelldiversFactions.humans.color,
                          height: 20,
                        ),
                        flex: (planet.objectiveProgression! * 100).floor(),
                      ),
                      SizedBox(width:2),
                      Flexible(
                        child: Container(
                          color: planet.ennemy!.color,
                          height: 20,
                        ),
                        flex: ((1 - planet.objectiveProgression!) * 100).floor(),
                      ),
                    ],
                  ),
                )],
          )),
            ],
          ),
    );
  }
}
