import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glyco/providers/measurement.dart';
import 'package:glyco/providers/measurements.dart';
import 'package:glyco/widgets/forms/exercise_form.dart';
import 'package:glyco/widgets/shortcuts/shortcut.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockMeasurements extends Mock implements Measurements {}

class MockMeasurement extends Mock implements Measurement {}

void main() async {
  Measurements mockMeasurements;
  Measurement mockMeasurement;
  setUp(() {
    mockMeasurements = MockMeasurements();
    mockMeasurement = MockMeasurement();
    when(mockMeasurement.a1cLevel).thenReturn(0);
    when(mockMeasurement.avgGlucoseLevel).thenReturn(0);
    when(mockMeasurement.calories).thenReturn(0);
    when(mockMeasurement.carbs).thenReturn(0);
    when(mockMeasurement.currGlucoseLevel).thenReturn(0);
    when(mockMeasurement.date).thenReturn(DateTime.now());
    when(mockMeasurement.exerciseTime).thenReturn(0);
    when(mockMeasurement.id).thenReturn('0');
    when(mockMeasurement.lastUpdate).thenReturn(DateTime.now());
    when(mockMeasurement.steps).thenReturn(0);
    when(mockMeasurement.userId).thenReturn('0');
    when(mockMeasurements.measurements).thenReturn([
      Measurement(
        id: '0',
        date: DateTime.now(),
        lastUpdate: DateTime.now(),
        avgGlucoseLevel: 0,
        currGlucoseLevel: 0,
        steps: 0,
        exerciseTime: 0,
        calories: 0,
        carbs: 0,
        a1cLevel: 0,
        userId: '0',
      )
    ]);
  });
  Future<void> _buildShortcutWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Measurement>.value(
            value: mockMeasurement,
          ),
          ChangeNotifierProvider<Measurements>.value(
            value: mockMeasurements,
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Shortcut(
                FontAwesomeIcons.running, () {}, ExerciseForm(), 'EXERCISE'),
          ),
        ),
      ),
    );
  }

  testWidgets('Shortcut widget builds properly', (WidgetTester tester) async {
    await _buildShortcutWidget(tester);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
  });
}
