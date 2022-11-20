import 'package:dami_test_project/styles.dart';
import 'package:dami_test_project/widgets/dami_material_button.dart';
import 'package:flutter/material.dart';

class ErrorScreenBody extends StatelessWidget {
  const ErrorScreenBody({
    Key? key,
    required this.onTryAgainPressed,
  }) : super(key: key);

  final void Function() onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Data download failed Text
          Text(
            'DATA DOWNLOAD\n'
            'FAILED',
            style: FigmaTextStyles.titleLarge.copyWith(
              color: FigmaColors.lightBlue,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 28),

          // Try again button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DamiMaterialButton(
              text: 'TRY AGAIN',
              onPressed: onTryAgainPressed,
            ),
          ),
        ],
      ),
    );
  }
}
