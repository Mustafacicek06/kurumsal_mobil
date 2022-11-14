import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  ///controller of the text field
  TextEditingController? controller;

  ///changing value when user type in the field
  void Function(String text)? onChange;

  ///validate
  String? Function(String? text)? onValidate;

  ///when the value which user entered is valid,this function will be called
  void Function(String? text)? onSubmit;

  ///margin
  EdgeInsetsGeometry? margin;

  ///space between container and text field
  EdgeInsetsGeometry? padding;

  EdgeInsets? scrollPadding;

  ///space between container and text field
  EdgeInsetsGeometry? contentPadding;

  ///background color
  Color? backgroundColor;

  ///when pages is resume, device keyboard will open
  bool? autoFocus;

  String? initialValue;

  ///text style of text field
  TextStyle? textStyle;

  ///maximum line
  int maxLine = 1;

  ///hint text
  String? hintText;

  ///error text
  String? errorText;

  ///error text style
  TextStyle? errorTextStyle;

  ///text style of text field
  TextStyle? hintTextStyle;

  TextInputType? keyboardType;

  BorderRadiusGeometry? borderRadius;

  double borderWidth;

  Color borderColor;

  bool obscureText;

  bool isDense;

  TextAlignVertical textAlignVertical;

  Color? cursorColor;
  Radius? cursorRadius;
  double cursorWidth = 1;
  double? cursorHeight;

  Widget? suffixIcon;
  FocusNode? focusNode;

  CustomTextField({
    Key? key,
    this.controller,
    this.onChange,
    this.onValidate,
    this.onSubmit,
    this.keyboardType,
    this.autoFocus,
    this.initialValue,
    this.margin,
    this.padding,
    this.scrollPadding,
    this.contentPadding,
    this.backgroundColor,
    this.borderRadius,
    this.cursorColor,
    this.cursorRadius,
    this.cursorWidth = 2,
    this.textStyle,
    this.maxLine = 1,
    this.hintText,
    this.hintTextStyle,
    this.borderWidth = 1.0,
    this.errorText,
    this.errorTextStyle,
    this.obscureText = false,
    this.borderColor = Colors.black,
    this.textAlignVertical = TextAlignVertical.center,
    this.isDense = true,
    this.suffixIcon,
    this.focusNode,
  }) : super(key: key) {
    if (this.backgroundColor == null) {
      this.backgroundColor = Colors.purple.withOpacity(0.2);
    }
    if (this.textStyle == null) {
      this.textStyle = TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.purple);
    }
    if (this.cursorColor == null) {
      this.cursorColor = Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: this.padding ??
          const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: this.borderColor,
          width: this.borderWidth,
        ),
      ),
      child: TextFormField(
        textAlignVertical: textAlignVertical,
        obscureText: obscureText,
        initialValue: this.initialValue,
        keyboardType: this.keyboardType,
        onSaved: this.onSubmit,
        focusNode: this.focusNode,
        validator: this.onValidate,
        autofocus: this.autoFocus ?? false,
        style: this.textStyle,
        maxLines: this.maxLine,
        cursorColor: this.cursorColor,
        cursorRadius: this.cursorRadius,
        cursorWidth: this.cursorWidth,
        cursorHeight: this.cursorHeight,
        scrollPadding: this.scrollPadding ?? EdgeInsets.all(20),
        decoration: InputDecoration(
          isDense: isDense,
          border: InputBorder.none,
          hintText: this.hintText,
          hintStyle: this.hintTextStyle,
          errorText: this.errorText,
          errorStyle: this.errorTextStyle,
          contentPadding: this.contentPadding,
          suffixIcon: this.suffixIcon,
        ),
        controller: this.controller,
        onChanged: this.onChange,
      ),
    );
  }
}
