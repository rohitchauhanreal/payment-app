import 'package:flutter/material.dart';
class RowOfCircles extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> texts;

  const RowOfCircles({
    Key? key,
    required this.imagePaths,
    required this.texts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        imagePaths.length,
            (index) => Column(
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.asset(
                imagePaths[index],
                width: 25,
                height: 25,
              ),
            ),
            Text(texts[index]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

