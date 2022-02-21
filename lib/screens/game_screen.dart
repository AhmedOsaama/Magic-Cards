import 'package:flutter/material.dart';
import 'package:magic_cards/providers/element.dart';
import 'package:magic_cards/providers/management.dart';
import 'package:magic_cards/screens/gameover_screen.dart';
import 'package:magic_cards/widgets/gradient.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Management management;
  List<String> cardTypes = [
    'leaf',
    'leaf',
    'grapes',
    'grapes',
    'orange',
    'orange',
    'lemon',
    'lemon',
    'star_type',
    'star_type',
    'melon',
    'melon',
    'seven',
    'seven',
    'apple',
    'apple'
  ];
  List<Tile> cards = [];

  bool start = true;

  int playerLives = 3;
  int showingCards = 0;
  int score = 0;
  Tile? selectedCard;

  void selectCard(Tile card, int cardIndex) async {
    if (card.hidden == true) {
      setState(() {
        card.hidden = false;
      });
      if (selectedCard == null) {
        selectedCard = card;
        selectedCard!.index = cardIndex;
        // showingCards++;
      } else {
        if (selectedCard!.value == card.value) {
          management.playMusic(management.audioPaths['pair of cards']!);
          showingCards += 2;
          management.typePairsNum[card.value] = management.typePairsNum[card.value]! + 1;
          setState(() {
            score += 50;
            // cards.removeWhere((cardd) => cardd.value == card.value);
          });
          //typePairsNum[selectedCard.value] += 2;
        } else {
          await Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              playerLives--;
              print(playerLives);
              card.hidden = true;
              cards[cards.indexOf(selectedCard!)].hidden = true;
            });
          });
        }
        selectedCard = null;
      }
    }
  }

  void fillCards() {
    cards = [];
    for (var type in cardTypes) {
      cards.add(Tile(value: type, hidden: false));
    }
    cards.shuffle();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        hideCards();
      });
    });
  }

  void hideCards() {
    for (var card in cards) {
      if (!card.hidden) {
        card.hidden = true;
      }
    }
  }

  void gameOver(){
    management.playMusic(management.audioPaths['game over']!);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => GameOverScreen(score)));
    management.score <= score ? management.score = score : null;                //save high score.
  }

  @override
  void didChangeDependencies() {
    management = Provider.of<Management>(context);
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    if (start) {
      fillCards();
      start = false;
    }
    if (playerLives <= 0) {
      Future.delayed(Duration(milliseconds: 500),(){
      gameOver();
      });
    } else {
      if (showingCards >= 16) {
        fillCards();
        showingCards = 0;
      }
    }
    return Scaffold(
        body: Stack(
      children: [
        GradientBackground(),
        Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red,width: 2),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.all(3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('images/light_horizontal.png',),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('images/light_vertical.png',height: MediaQuery.of(context).size.height * 0.7,width: 28,fit: BoxFit.cover,),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 214, 74, 64),
                        ),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 9,
                            mainAxisExtent: 115,
                          ),
                          itemCount: cards.length,
                          itemBuilder: (ctx, i) => Material(
                            borderRadius: BorderRadius.circular(15),
                            elevation: 7,
                            child: GestureDetector(
                              onTap: () => selectCard(cards[i], i),
                              child: cards[i].hidden == true
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: const Color.fromARGB(255, 44, 74, 147)),
                                        color: const Color.fromARGB(255, 44, 74, 147),
                                      ),
                                      child: Center(
                                          child: Image.asset('images/star.png')))
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(width: 2,color: const Color.fromARGB(255, 44, 74, 147)),
                                          color:
                                              Color.fromARGB(255, 102, 117, 153)),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Image.asset(
                                            cards[i].getCategoryImageSrc()),
                                      ))),
                            ),
                          ),
                        ),
                      ),
                      Image.asset('images/light_vertical.png',height: MediaQuery.of(context).size.height * 0.7,width: 28,fit: BoxFit.cover,),
                    ],
                  ),
                  Image.asset('images/light_horizontal.png',),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ListView.builder(
                        itemCount: playerLives,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, i) =>
                            Image.asset('images/heart.png')),
                  ),
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 1, 86, 163),
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        '\$   $score',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
