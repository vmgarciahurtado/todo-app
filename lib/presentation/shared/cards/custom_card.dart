import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    this.body,
    this.color = Colors.white,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
    this.elevation = 2,
  }) : super(key: key);

  Color color = Colors.white;
  final Widget? body;
  final double borderRadius;
  final EdgeInsets padding;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: padding,
        child: body,
      ),
    );
  }
}
