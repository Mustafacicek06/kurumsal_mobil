import 'package:flutter/material.dart';
import 'package:kurumsal_mobil/core/init/theme/app_color_service.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  ///child parameter must be entered
  final Widget? child;

  ///The amount of space by which to inset the child.
  EdgeInsetsGeometry? padding = const EdgeInsets.all(8);

  ///Empty space to surround the container
  EdgeInsetsGeometry? margin = EdgeInsets.zero;

  ///width of button
  double? width;

  ///height of button
  double? height;

  /// The radii for each corner of button.
  BorderRadius? borderRadius = BorderRadius.circular(2);

  ///button border color
  Color? borderColor;

  ///default border color and highlight color
  Color? color = AppColorService.primary;

  ///Button border width
  double? borderWidth = 1;

  ///Button elevation
  double? elevation = 0;

  ///Border style
  BorderStyle? borderStyle = BorderStyle.solid;

  ///BoxShadows
  List<BoxShadow>? boxShadow;

  ///Inkwell overlay color . It will appear when the button is clicked
  Color? overlayColor;

  ///Inkwell focus color
  Color? focusColor;

  ///Inkwell hover color
  Color? hoverColor;

  ///checking the button type is filled
  bool _isFilled = false;

  ///when the button click,this function will work
  void Function()? onPress;

  ///Button shape
  AppButtonShape? shape = AppButtonShape.rectangle;

  AppButton.fill({
    Key? key,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.shape = AppButtonShape.rectangle,
    this.child,
    this.onPress,
    this.borderWidth,
    this.borderRadius,
    this.boxShadow,
    this.borderColor,
    this.elevation,
    this.color = AppColorService.primary,
    this.overlayColor,
    this.borderStyle = BorderStyle.none,
    this.focusColor,
    this.hoverColor,
  }) : super(key: key) {
    _isFilled = true;
    overlayColor ??= Colors.white.withOpacity(0.1);
  }

  AppButton.outline({
    Key? key,
    this.width,
    this.shape = AppButtonShape.rectangle,
    this.height,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.child,
    this.onPress,
    this.borderWidth = 2,
    this.borderRadius,
    this.boxShadow,
    this.borderColor,
    this.elevation,
    this.color = Colors.purple,
    this.overlayColor,
    this.focusColor,
    this.borderStyle,
    this.hoverColor,
  }) : super(key: key) {
    _isFilled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: boxShadow),
      padding: margin ?? const EdgeInsets.all(4),
      child: Material(
        elevation: elevation ?? 0,
        color: _isFilled ? color : Colors.transparent,
        shape: _getShapeBorder(),
        child: InkWell(
          onTap: onPress,
          overlayColor: MaterialStateProperty.all<Color>(
            overlayColor ?? color!.withOpacity(0.3),
          ),
          focusColor: focusColor,
          customBorder: _getShapeBorder(),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }

  ShapeBorder? _getShapeBorder() {
    if (shape == AppButtonShape.rectangle) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        side: _getBorderSide(),
      );
    } else if (shape == AppButtonShape.pill) {
      return StadiumBorder(
        side: _getBorderSide(),
      );
    } else if (shape == AppButtonShape.circle) {
      return CircleBorder(
        side: _getBorderSide(),
      );
    }
    return null;
  }

  BorderSide _getBorderSide() {
    return BorderSide(
      color: borderColor ?? this.color!,
      width: borderWidth ?? 1,
      style: borderStyle ?? BorderStyle.solid,
    );
  }
}

///checking the Button shape type
enum AppButtonShape { rectangle, pill, circle }
