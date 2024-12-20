import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.amber,
    Colors.teal,
    Colors.lightBlue,
    Colors.blue,
    Colors.grey,
    Colors.purple
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        int index = t % colors.length;
        return colors[index];
      },
    );
  }
}
