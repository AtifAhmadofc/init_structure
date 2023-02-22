import 'package:flutter/material.dart';

class CommonHelper {
  static showSnackBar(context, msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static unFocusTextField(context) {
    FocusScope.of(context).unfocus();
  }

}
