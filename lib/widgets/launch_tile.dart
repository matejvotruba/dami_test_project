import 'package:cached_network_image/cached_network_image.dart';
import 'package:dami_test_project/models/rocket_launch.dart';
import 'package:dami_test_project/screens/rocket_datail_screen/rocket_detail_screen.dart';
import 'package:dami_test_project/styles.dart';
import 'package:flutter/material.dart';

class LaunchTile extends StatelessWidget {
  const LaunchTile({
    Key? key,
    required this.launch,
  }) : super(key: key);

  final RocketLaunch launch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RocketDetailScreen(rocketId: launch.rocketId),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 15,
                  offset: Offset(0, 4),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: launch.imageUrl != null
                          ? CachedNetworkImage(
                              width: 57,
                              height: 57,
                              imageUrl: launch.imageUrl!,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : Image.asset(
                              'images/damik/damik.png',
                              width: 57,
                              height: 57,
                            ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 206,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.name,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: FigmaTextStyles.titleLarge,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Flight number: ',
                          style: FigmaTextStyles.labelSmall.copyWith(
                            fontWeight: FontWeight.w700,
                            color: FigmaColors.lightBlue,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: launch.flightNumber.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Flight date: ',
                          style: FigmaTextStyles.labelSmall.copyWith(
                            fontWeight: FontWeight.w700,
                            color: FigmaColors.lightBlue,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: launch.date,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.chevron_right,
                        color: FigmaColors.lightBlue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
