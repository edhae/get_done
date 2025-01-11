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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Colors',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'App Theme',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                      leading: Icon(Icons.dark_mode_outlined),
                      onTap: () {},
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                      height: 0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          'Personalize Color',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        leading: Icon(Icons.color_lens_outlined),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
