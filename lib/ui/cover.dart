import 'package:flutter/material.dart';
import 'const.dart';


class Cover extends StatelessWidget{
  final Widget child;

  Cover({@required this.child}); 

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [appColor[0], appColor[1]]
            )
        ),
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: child,
          )
        )
      ),
    );
  }
}