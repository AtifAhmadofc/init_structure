import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/constants_color.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color:  ColorConstants.backButtonColor,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(12),
        child: Image.asset(
          "assets/icons/Iconly-Curved-Arrow - Left 2.png",
        ),
      ),
    );
  }
}
