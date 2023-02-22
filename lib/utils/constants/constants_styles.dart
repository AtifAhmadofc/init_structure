import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/constants_color.dart';

abstract class Styles {
  static InputBorder textFieldBorderStyle = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorConstants.textFieldBorderColor,
      width: 1,
    ),
  );

  static InputBorder textFieldBorderStyle2 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: ColorConstants.textFieldBorderColor,
      width: 1,
    ),
  );
}
