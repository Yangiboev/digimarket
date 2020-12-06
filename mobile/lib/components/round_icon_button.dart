import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed, this.color, this.size});

  final Icon icon;
  final Function onPressed;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: size, height: size),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
