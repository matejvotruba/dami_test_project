import 'package:dami_test_project/styles.dart';
import 'package:flutter/material.dart';

class AttributeLabelText extends StatelessWidget {
  const AttributeLabelText({
    Key? key,
    required this.value,
    required this.name,
  }) : super(key: key);

  final String value;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: name,
        style: FigmaTextStyles.labelSmall.copyWith(
          color: FigmaColors.lightBlue,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
              text: value,
              style: FigmaTextStyles.labelSmall.copyWith(
                color: FigmaColors.lightBlue,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}
