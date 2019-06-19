import 'package:flutter/material.dart';

class Action {
  final Key key;
  final IconData iconData;
  final Function onTap;

  Action({
    @required this.key,
    @required this.iconData,
    @required this.onTap,
  }) : assert(key != null),
       assert (iconData != null),
       assert (onTap != null);
}