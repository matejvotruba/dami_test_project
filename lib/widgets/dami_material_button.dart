import 'package:flutter/material.dart';
import 'package:dami_test_project/styles.dart';

class DamiMaterialButton extends StatelessWidget {
  const DamiMaterialButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: FigmaColors.damiGrass,
        boxShadow: const <BoxShadow>[
          FigmaEffectStyles.boxShadow,
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: FigmaTextStyles.titleMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
