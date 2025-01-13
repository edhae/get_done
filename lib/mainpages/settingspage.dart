import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/theme/themedata.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:provider/provider.dart';

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
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SetAppThemeAlert(),
                        );
                      },
                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            'App Theme',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(Icons.dark_mode_outlined),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            'Personalize Color',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(Icons.color_lens_outlined),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
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

class SetAppThemeAlert extends StatelessWidget {
  const SetAppThemeAlert({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode selectedMode =
        Provider.of<ThemeProvider>(context, listen: false).themeMode;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Select Theme',
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Dunkel',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: selectedMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      selectedMode = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  'Light',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: selectedMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      selectedMode = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  'System',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: selectedMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      selectedMode = value!;
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false)
                .setTheme(selectedMode);
            Navigator.of(context).pop();
          },
          child: const Text('Set'),
        ),
      ],
    );
  }
}
