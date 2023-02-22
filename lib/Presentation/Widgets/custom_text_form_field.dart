import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/constants_color.dart';
import 'package:init_structure/utils/constants/constants_styles.dart';


class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.icon,
    required this.hintString,
    this.validator,
    this.suffixIcon,
    this.margin,
    this.obscureText = false,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? icon;
  final String hintString;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final EdgeInsets? margin;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(top: 32),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: Colors.black,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          label: Text(
            widget.hintString,
            style: TextStyle(
              color: ColorConstants.textFieldHintColor,
              fontSize: 16,
            ),
          ),
          prefixIcon: widget.icon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: ImageIcon(
                    AssetImage(
                      widget.icon!,
                    ),
                    size: 24,
                    color: ColorConstants.textFieldIconColor,
                  ),
                ),
          suffixIcon: widget.suffixIcon,
          border: Styles.textFieldBorderStyle,
          errorBorder: Styles.textFieldBorderStyle,
          enabledBorder: Styles.textFieldBorderStyle,
          focusedBorder: Styles.textFieldBorderStyle,
          focusedErrorBorder: Styles.textFieldBorderStyle,
        ),
      ),
    );
  }
}
