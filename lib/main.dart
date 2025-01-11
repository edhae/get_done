import 'package:flutter/material.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:provider/provider.dart';
import 'package:get_done/theme/themedata.dart';
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
      debugShowCheckedModeBanner: false,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        elevation: 0,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(23),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.alphaBlend(Colors.black.withValues(alpha: Theme.of(context).brightness == Brightness.dark ? 0.4 : 0), personalizedColor) ,
                Color.alphaBlend(Colors.black.withValues(alpha: Theme.of(context).brightness == Brightness.dark ? 0.4 : 0), Color.alphaBlend(personalizedColor.withValues(alpha: 0.65), Colors.white)),
              ],
            ),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
