import 'package:app_ui_03/custom/custom_app_bar.dart';
import 'package:app_ui_03/view/tab_home.dart';
import 'package:app_ui_03/view/tab_message.dart';
import 'package:app_ui_03/view/tab_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  int currentTabIndex = 0;
   List<Widget> tabs = [
    TabHome(),
    TabMessages(),
    TabProfile()
  ];
   onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: CustomAppBar('Custom App Bar'),
        body:tabs[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: currentTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text("Messages"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            )
          ],
        ),       
      ),      
    );
  }
}

