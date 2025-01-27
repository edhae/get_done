import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:provider/provider.dart';
import 'package:get_done/theme/themeprovider.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    Color personalizedColor = Provider.of<ThemeProvider>(context, listen: false).personalizedColor;
 
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Focus',
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
