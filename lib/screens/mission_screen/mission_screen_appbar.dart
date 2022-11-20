import 'package:dami_test_project/styles.dart';
import 'package:flutter/material.dart';

class MissionScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MissionScreenAppBar({
    Key? key,
    required this.appBarHeight,
  }) : super(key: key);

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          FigmaEffectStyles.boxShadow,
        ],
        borderRadius: kAppBarBorderRadius,
      ),
      child: AppBar(
        toolbarHeight: appBarHeight,
        backgroundColor: FigmaColors.baliBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: kAppBarBorderRadius,
        ),
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 53, bottom: 15),
          child: Column(
            children: [
              Image.asset('images/logo_appbar/dami_logo_white.png'),
              const SizedBox(height: 8),
              Text(
                'SPACE X FLIGHTS',
                style: FigmaTextStyles.labelMedium.copyWith(
                  color: FigmaColors.lightBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
