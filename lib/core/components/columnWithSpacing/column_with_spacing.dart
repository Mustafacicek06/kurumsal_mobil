import 'package:flutter/material.dart';

class ColumnWithSpacing extends StatelessWidget {
  const ColumnWithSpacing(
      {Key? key,
      required this.children,
      required this.space,
      this.mainAxisAlignment,
      this.crossAxisAlignment})
      : super(key: key);
  final List<Widget> children;
  final double space;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: children
          .map((child) =>
              Padding(padding: EdgeInsets.only(top: space), child: child))
          .toList(),
    );
  }
}
