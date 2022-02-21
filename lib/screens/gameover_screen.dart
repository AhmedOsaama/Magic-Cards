import 'package:flutter/material.dart';
import 'package:magic_cards/providers/management.dart';
import 'package:magic_cards/screens/game_screen.dart';
import 'package:magic_cards/screens/home_screen.dart';
import 'package:magic_cards/widgets/gradient.dart';
import 'package:provider/provider.dart';

class GameOverScreen extends StatelessWidget {
  final score;
  GameOverScreen(this.score);
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
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isEnglish
                    ? const Text(
                        "GAME OVER",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w800),
                      )
                    : const Text(
                        "Игра окончена!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w800),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isEnglish
                        ? const Text(
                            'You win',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          )
                        : const Text(
                            'Вы выиграли',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                    Text(
                      '\$ ${score.toString()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 10),
                        transform: Matrix4.rotationZ(-15 * 3.14 / 180)
                          ..translate(-15.0),
                        child: IconButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => HomeScreen())),
                          icon: const Icon(
                            Icons.home,
                          ),
                          iconSize: 86,
                          color: Colors.white,
                        )),
                    IconButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => GameScreen())),
                      icon: const Icon(
                        Icons.refresh_rounded,
                      ),
                      iconSize: 86,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
