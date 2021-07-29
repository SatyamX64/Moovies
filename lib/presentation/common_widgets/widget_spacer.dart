import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  late final double _height;

  WidgetSpacer({double? height}) : _height = height ?? 16;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: _height,
    );
  }
}
