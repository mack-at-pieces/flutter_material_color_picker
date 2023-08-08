import 'package:flutter/material.dart';

typedef OnColorChoose = void Function(Color color);

class CircleColor extends StatelessWidget {
  static const double _kColorElevation = 4.0;

  final bool isSelected;
  final Color color;
  final OnColorChoose? onColorChoose;
  final double circleSize;
  final double? elevation;
  final IconData? iconSelected;
  final double? iconSelectedSize;

  const CircleColor({
    Key? key,
    required this.color,
    required this.circleSize,
    this.onColorChoose,
    this.isSelected = false,
    this.elevation = _kColorElevation,
    this.iconSelected,
    this.iconSelectedSize,
  })  : assert(circleSize >= 0, "You must provide a positive size"),
        assert(!isSelected || (isSelected && iconSelected != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    final icon = brightness == Brightness.light ? Colors.black : Colors.white;

    return Material(
      elevation: elevation ?? _kColorElevation,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onColorChoose != null ? () => onColorChoose!(color) : null,
        child: CircleAvatar(
          radius: circleSize / 2,
          backgroundColor: color,
          child: isSelected
              ? Icon(
                  iconSelected,
                  color: icon,
                  size: iconSelectedSize,
                )
              : null,
        ),
      ),
    );
  }
}
