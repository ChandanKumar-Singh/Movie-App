import 'package:flutter/material.dart';

class Ctext extends StatelessWidget {
  Ctext(
      {Key? key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.overflow})
      : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
   TextOverflow? overflow = TextOverflow.ellipsis;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size, color: color, fontWeight: weight, overflow: overflow),
    );
  }
}
