import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    Color personalizedColor = Provider.of<ThemeProvider>(context, listen: false).personalizedColor;

    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Today',
          colors: [
            personalizedColor,
            personalizedColor.withValues(alpha: 0.5),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
