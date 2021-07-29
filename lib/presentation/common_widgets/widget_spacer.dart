import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  late final double _height;
  late final double _width;

  WidgetSpacer({double? height, double? width})
      : _height = height ?? 16,
        _width = width ?? 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
    );
  }
}
