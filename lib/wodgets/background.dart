import 'package:flutter/material.dart';

class BackGroudInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new GradientBack(),
        new Positioned(
            bottom: 0.0,
            child: new Container(
              width: MediaQuery.of(context).size.width,
              height: 125.0,
              color: Colors.lightBlue,
            ))
      ],
    );
  }
}

class GradientBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        colors: [Color(0x072D65), Color(0x0D6AF3)],
        begin: const FractionalOffset(1.0, 0.1),
        end: const FractionalOffset(1.0, 0.9),
      )),
    );
  }
}
