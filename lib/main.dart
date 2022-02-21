// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_cards/providers/management.dart';
import 'package:magic_cards/screens/game_screen.dart';
import 'package:magic_cards/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Management())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magic Cards',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),
          )
        ),
        home: WillPopScope(child: HomeScreen(), onWillPop: () async {
          dispose();
          return Future.value(true);
        }),
      ),
    );
  }
}

