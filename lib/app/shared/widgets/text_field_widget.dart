import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/app/shared/utils/responsiveness.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false,
    this.textInputType,
    this.onChanged,
    this.enabled,
    this.controller,
    this.onTapSuffixIcon,
    this.onFieldSubmitted,
    this.textInputAction,
    this.errorText,
    this.inputFormatters,
    this.autofocus = false,
    this.hintText,
    this.focusNode,
  });

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  final void Function()? onTapSuffixIcon;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final String? hintText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: TextFormField(
        focusNode: focusNode,
        autofocus: autofocus,
        style: TextStyle(
          color: Colors.black.withOpacity(.7),
          fontSize: 14,
        ),
        inputFormatters: inputFormatters,
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(6),
          ),
          isDense: true,
          labelStyle: TextStyle(
            color: Colors.black.withOpacity(.7),
            fontSize: 14,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Colors.black,
                  size: 20,
                )
              : null,
          suffixIcon: GestureDetector(
            onTap: onTapSuffixIcon,
            child: Icon(
              suffixIcon,
              color: Colors.black.withOpacity(.7),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
