import 'package:flutter/material.dart';

class IconeBtn extends StatelessWidget {
  final IconData icone;
  const IconeBtn({super.key, required this.icone});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * .17,
      height: height * .06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 2,
          )
        ],
      ),
      child: Center(
        child: Icon(
          icone,
          color: Colors.deepPurple,
          size: 25,
        ),
      ),
    );
  }
}
