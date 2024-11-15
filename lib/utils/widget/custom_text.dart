import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.maxLine,
      this.textAlign,
      this.style,
      this.softWrap})
      : super(key: key);
  final String text;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextStyle? style;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      softWrap: softWrap,
      textAlign: textAlign,
      style: style,
    );
  }
}
