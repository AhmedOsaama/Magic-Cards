import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final imageSrc;
  final int cards;
  final int score;

  TextStyle _textStyle = const TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w800);

  ResultItem({Key? key, this.imageSrc, required this.cards, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255,5, 15, 67),
      ),
      width: 120,
      height: 60,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2,color: const Color.fromARGB(255, 44, 74, 147)),
                  color: Color.fromARGB(255, 102, 117, 153)),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset(
                        imageSrc),
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Column(
              children: [
                    Text('x$cards',style: _textStyle,),
                    Text('\$$score',style: _textStyle,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
