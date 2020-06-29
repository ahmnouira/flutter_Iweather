import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double width;

  Loading({this.width = 3});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blueGrey,
        value: 20,
        semanticsLabel: 'Waiting',
        strokeWidth: width,
      ),
    );
  }
}
