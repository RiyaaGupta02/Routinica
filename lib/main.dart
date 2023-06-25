import 'package:flutter/material.dart';
// import 'package:routinica/home_page.dart';
import 'package:routinica/models/hidden_drawer.dart';
import 'package:flutter/src/material/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      // Application name
      title: 'Flutter Demo',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // A widget which will be started on application startup
      //  home: HomePage(),
      */
      debugShowCheckedModeBanner: false,
      // here the main changing it to HiddenDrawer while in it keeping the home page
      home: HiddenDrawer(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
