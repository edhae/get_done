import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/theme/themedata.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Settings',
          colors: [
            personalizedColor,
            personalizedColor.withValues(alpha: 0.5),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
        child: Column(
          children: [
            Text('Farben'),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text('App Theme'),
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
