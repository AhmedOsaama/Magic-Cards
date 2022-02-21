import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 98, 180),
            Color.fromARGB(255, 1, 6, 51),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1],
        ),
      ),
    );
  }
}
