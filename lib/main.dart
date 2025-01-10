import 'package:flutter/material.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:provider/provider.dart';
import 'package:get_done/theme/themedata.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get_done/mainpages/todaypage.dart';
import 'package:get_done/mainpages/todospage.dart';
import 'package:get_done/mainpages/focuspage.dart';
import 'package:get_done/mainpages/settingspage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Get Done',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeProvider.themeMode,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> pages = [
    TodayPage(),
    TodosPage(),
    FocusPage(),
    SettingsPage()
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Ionicons.home,
                size: 35,
              ),
              tooltip: 'Heute',
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Ionicons.checkbox,
                size: 35,
              ),
              tooltip: 'Todos',
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            SizedBox(
              width: 40,
            ),
            IconButton(
              icon: Icon(
                Ionicons.bulb,
                size: 35,
              ),
              tooltip: 'Fokus',
              onPressed: () {
                setState(() {
                  currentPage = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Ionicons.settings,
                size: 35,
              ),
              tooltip: 'Einstellungen',
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        elevation: 0,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
