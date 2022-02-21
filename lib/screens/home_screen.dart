import 'package:flutter/material.dart';
import 'package:magic_cards/providers/management.dart';
import 'package:magic_cards/screens/game_screen.dart';
import 'package:magic_cards/widgets/button.dart';
import 'package:magic_cards/widgets/gradient.dart';
import 'package:magic_cards/widgets/results.dart';
import 'package:magic_cards/widgets/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool results = false;

  bool settings = false;

  void closeSettings() {
    setState(() {
      settings = false;
    });
  }

  void closeResults() {
    setState(() {
      results = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context);
    final isEnglish = management.isEnglish;
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Image.asset('images/coins1.png'),
          Image.asset('images/coins2.png'),
          Image.asset('images/coins3.png'),
          Image.asset('images/coins5.png'),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/coins4.png')),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "BEST",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(width: 20,),
                  Button(width: 108, text: '\$ ${management.score.toString()}', height: 28, onPressed: (){})
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  width: 215,
                  text: isEnglish ? 'PLAY' : 'Играть',
                  height: 47,
                  fontSize: 36,
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => GameScreen())),
                ),
                Button(
                  width: 215,
                  text: isEnglish ? 'SETTINGS' : 'Настройки',
                  height: 47,
                  fontSize: 36,
                  onPressed: () {
                    setState(() {
                      settings = true;
                    });
                  },
                ),
                Button(
                  width: 215,
                  text: isEnglish ? 'RESULTS' : 'Результаты' ,
                  height: 47,
                  fontSize: 36,
                  onPressed: () {
                    setState(() {
                      results = true;
                    });
                  },
                ),
              ],
            ),
          ),
          if (settings)
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(127, 0, 0, 0),
              ),
              child: Center(
                  child: Settings(
                closeSettings: closeSettings,
              )),
            ),
          if (results)
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(127, 0, 0, 0),
              ),
              child: Center(
                  child: Results(
                closeResults: closeResults,
              )),
            ),
        ],
      ),
    );
  }
}
