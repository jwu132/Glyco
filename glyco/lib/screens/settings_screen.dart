import 'package:flutter/material.dart';
import 'package:glyco/providers/options.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override

  ClipRRect exportData(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        width: 250,
        height: 40,
        color: Colors.blue[300],
        child: FlatButton(
          child: Text("EXPORT DATA",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          onPressed: () {
           
          },
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Spacer(),
              Icon(
                Icons.ac_unit,
              ),
              Spacer(),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jessica Woodard",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "jess.woodard@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height:15),
                Row(children: [
                  Spacer(),
                  exportData(context),
                  Spacer(),
                ]),
                SizedBox(height:15),
                Text(
                  "Shortcuts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height:15),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                        Text("Manual Input"),
                        Spacer(),
                        Icon(
                          Icons.fastfood,
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                        Text(" ${settings.mealCalories} kcal\n ${settings.mealCarbs}g carbs"),
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      children: [
                        Icon(
                          Icons.donut_small,
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                        Text(" ${settings.snackCalories} kcal\n ${settings.snackCarbs}g carbs"),
                        Spacer(),
                        Icon(
                          Icons.free_breakfast,
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                        Text(" ${settings.drinkCalories} kcal\n ${settings.drinkCarbs} carbs"),
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_run,
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                        Text("${settings.exerciseTime} min activity"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height:15),
                Text(
                  "Integrations",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
