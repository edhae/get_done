import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/theme/themedata.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Color personalizedColor =
        Provider.of<ThemeProvider>(context, listen: false).personalizedColor;

    Color personalizedIconColor = Color.alphaBlend(
        personalizedColor.withValues(alpha: Theme.of(context).brightness == Brightness.dark ? 0.5 : 0.65),
        Theme.of(context).colorScheme.secondary);

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
                    width: 10,
                  ),
                  Text(
                    'Colors',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: 1,
                    )),
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
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: Icon(
                            Icons.dark_mode_outlined,
                            color: personalizedIconColor,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 0.5,
                      indent: 50,
                      endIndent: 50,
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SetpersonalizedColorAlert(),
                        );
                      },
                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            'Personalize Color',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: Icon(
                            Icons.color_lens_outlined,
                            color: personalizedIconColor,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
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

    Color personalizedColor =
        Provider.of<ThemeProvider>(context, listen: false).personalizedColor;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: GradientText(
        'Select App Theme',
        colors: [
          personalizedColor,
          personalizedColor.withValues(alpha: 0.5),
        ],
        style: TextStyle(fontWeight: FontWeight.w500),
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
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        TextButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false)
                .setTheme(selectedMode);
            Navigator.of(context).pop();
          },
          child: Text(
            'Save',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}

class SetpersonalizedColorAlert extends StatefulWidget {
  const SetpersonalizedColorAlert({super.key});

  @override
  State<SetpersonalizedColorAlert> createState() =>
      _SetpersonalizedColorAlertState();
}

class _SetpersonalizedColorAlertState extends State<SetpersonalizedColorAlert> {
  @override
  Widget build(BuildContext context) {
    Color personalizedColor =
        Provider.of<ThemeProvider>(context, listen: false).personalizedColor;
    Color pickedColor = personalizedColor;

    return AlertDialog(
      title: GradientText(
        'Select App Color',
        colors: [
          personalizedColor,
          personalizedColor.withValues(alpha: 0.5),
        ],
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      content: BlockPicker(
        pickerColor: pickedColor,
        availableColors: personalizableColors,
        useInShowDialog: true,
        onColorChanged: (newpersonalizedColor) {
          pickedColor = newpersonalizedColor;
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              personalizedColor = pickedColor;
            });
            Provider.of<ThemeProvider>(context, listen: false)
                .updateColor(pickedColor);
            Navigator.of(context).pop();
          },
          child: Text(
            'Save',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
