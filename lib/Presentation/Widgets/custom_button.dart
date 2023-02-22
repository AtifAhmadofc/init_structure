import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/constants_color.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onChanged,
    required this.btnText,
    this.margin,
    this.color,
    Key? key,
  }) : super(key: key);

  final String btnText;
  final EdgeInsets? margin;
  final Color? color;
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin?? const EdgeInsets.only(top: 60.0),
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        color:color??  ColorConstants.btnColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onChanged,
        child: Text(
          btnText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
