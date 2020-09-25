import 'package:flutter/material.dart';
import 'package:glyco/widgets/a1c_tile.dart';
import 'package:glyco/widgets/glucose_tile.dart';
import '../widgets/calories_tile.dart';
import '../providers/measurement.dart';
import 'package:provider/provider.dart';
import './long_tile.dart';

class MeasurementGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final measurement = Provider.of<Measurement>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlucoseTile(),
            Column(
              children: [
                LongTile(
                  data: measurement.steps.toString(),
                  unit: "steps",
                  icon: Icon(
                    Icons.accessible_forward,
                    size: 35,
                    color: Colors.white,
                  ),
                  updateTime: measurement.timestamp,
                ),
                LongTile(
                  data: measurement.exerciseTime.toString(),
                  unit: "min",
                  icon: Icon(
                    Icons.directions_run,
                    size: 35,
                    color: Colors.white,
                  ),
                  updateTime: measurement.timestamp,
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CaloriesTile(),
            A1CTile(),
          ],
        ),
      ],
    );
  }
}
