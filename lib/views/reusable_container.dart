import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({
    required this.currency,
  });

  final String currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFECAD00),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Center(
          child: Text(
        currency,
        style: TextStyle(
          fontSize: 35.0,
        ),
      )),
    );
  }
}
