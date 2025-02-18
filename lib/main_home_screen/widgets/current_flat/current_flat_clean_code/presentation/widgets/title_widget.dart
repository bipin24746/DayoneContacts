import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your apartment",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
