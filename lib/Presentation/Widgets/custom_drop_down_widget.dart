import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/constants_color.dart';
import 'package:init_structure/utils/constants/constants_styles.dart';


class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget(
      {Key? key,
      required this.dropdownList,
       this.icon,
      required this.hintString,
      required this.onChanged,
      this.validator})
      : super(key: key);

  final List<DropdownMenuItem> dropdownList;
  final String? icon;
  final String hintString;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: DropdownButtonFormField(
          items: dropdownList,
          validator: validator,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 30,
            color: ColorConstants.dropDownIconColor,
          ),
          decoration: InputDecoration(
            prefixIcon:
            icon==null?null:
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: ImageIcon(
                AssetImage(
                  icon!,
                ),
                size: 24,
                color:  ColorConstants.textFieldIconColor,
              ),
            ),
            hintText: hintString,
            hintStyle: TextStyle(
              color:  ColorConstants.textFieldHintColor,
              fontSize: 16,
            ),
            border: Styles.textFieldBorderStyle,
            errorBorder: Styles.textFieldBorderStyle,
            enabledBorder: Styles.textFieldBorderStyle,
            focusedBorder: Styles.textFieldBorderStyle,
            focusedErrorBorder: Styles.textFieldBorderStyle,
          ),
          onChanged: onChanged),
    );
  }
}
