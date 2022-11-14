import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kurumsal_mobil/core/init/theme/app_color_service.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.obscureText = false,
      this.keyboardType,
      this.isPasswordTextField = false,
      this.prefixIcon,
      this.validator,
      this.controller})
      : super(key: key);
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isPasswordTextField;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isPasswordTextField
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColorService.primary,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                })
            : null,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon!,
                color: Colors.red,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppColorService.primary,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        labelStyle: const TextStyle(color: AppColorService.primary),
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
      ),
      obscureText: !_passwordVisible,
      keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
    );
  }
}
