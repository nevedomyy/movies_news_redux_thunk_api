import 'package:flutter/material.dart';
import 'const.dart';


class Btn extends StatelessWidget{
  final String caption;
  final Function onTap;
  final bool firstBtn;

  Btn({
    @required this.caption,
    @required this.onTap,
    @required this.firstBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: firstBtn ? appColor[4] : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(45.0)),
        border: Border.all(
          width: 2.0,
          color: appColor[4]
        )
      ),
      child: InkWell(
        onTap: onTap,
        highlightColor: appColor[4],
        splashColor: appColor[4],
        borderRadius: BorderRadius.all(Radius.circular(45.0)),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Text(
            caption,
            style: appTextStyle[1],                        
          ),
        ),
      )
    );
  }
}