// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:magic_cards/providers/management.dart';
import 'package:magic_cards/widgets/result_item.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  final closeResults;
  const Results({Key? key, this.closeResults}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final management = Provider.of<Management>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 31, 45, 126),
            Color.fromARGB(255, 0, 15, 103),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "RESULTS",
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 15,
                      offset: Offset(0, 3),
                    )
                  ],
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Wrap(
            spacing: 34,
            runSpacing: 10,
            children: management.typePairsNum.entries
                .map((tile) => ResultItem(
                      cards: tile.value,
                      score: tile.value * 50,
                      imageSrc: 'images/${tile.key}.png',
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "BEST",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "\$ ${management.score}",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: closeResults,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 236,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 1, 88, 171),
                          Color.fromARGB(255, 2, 30, 116),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: management.language == Language.rus
                      ? Text("Политика конфиденциальности",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1)
                      : Text("Back to menu",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
