import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tictoctoegame/game.dart';
import 'loader.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        GamePage.id: (context) => GamePage(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const String id = "ScplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5), () => Navigator.pushNamed(context, GamePage.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 50.0,
                        child: Icon(
                          Icons.videogame_asset,
                          color: Colors.indigo,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Tic-Toc-Toe",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 300),
                    text: ['Tic-Toc-Toe'],
                    textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightGreenAccent),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Loader(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Online Game\nFor Everyone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
//                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
