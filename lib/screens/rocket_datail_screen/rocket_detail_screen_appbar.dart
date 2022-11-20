import 'package:auto_route/auto_route.dart';
import 'package:dami_test_project/styles.dart';
import 'package:flutter/material.dart';

class RocketDetailScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RocketDetailScreenAppBar({
    Key? key,
    required this.appBarHeight,
    required this.title,
  }) : super(key: key);

  final double appBarHeight;
  final String title;

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
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        backgroundColor: FigmaColors.baliBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: kAppBarBorderRadius,
        ),
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 47, bottom: 21, left: 33),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // AutoRoute pop
                  context.popRoute();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: FigmaTextStyles.titleLarge.copyWith(
                  color: Colors.white,
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
