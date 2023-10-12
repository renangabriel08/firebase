import 'package:flutter/material.dart';

class Linha extends StatelessWidget {
  const Linha({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 2,
      width: width * .33,
      color: Colors.deepPurple,
    );
  }
}
