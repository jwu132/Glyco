import 'package:flutter/material.dart';
import 'package:glyco/widgets/appBars/settings_app_bar.dart';
import '../providers/options.dart';
import '../providers/auth.dart';

//Widgets
import 'package:glyco/widgets/shortcuts/shortcuts_summary.dart';
import 'package:glyco/widgets/mainSettings/export_data_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Options>(context).settings;
    return Scaffold(
      appBar: SettingsAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/glyco_vector.jpg',
                    height: 250,
                    width: 250,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Provider.of<Auth>(context, listen: false).userName,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Provider.of<Auth>(context, listen: false).userEmail,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Spacer(),
                      ExportDataButton(),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Shortcuts",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  ChangeNotifierProvider.value(
                    value: settings,
                    child: ShortcutsSummary(),
                  ),
                  SizedBox(height: 15),
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
          ),
        ),
      ),
    );
  }
}
