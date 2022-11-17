import 'package:cached_network_image/cached_network_image.dart';
import 'package:dami_test_project/models/rocket_launch.dart';
import 'package:dami_test_project/screens/rocket_datail_screen/rocket_detail_screen.dart';
import 'package:dami_test_project/styles.dart';
import 'package:dami_test_project/widgets/attribute_label_text.dart';
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
        // Open RocketDetailScreen
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
                // Launch image
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

                // All texts
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Launch name
                      Text(
                        launch.name,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: FigmaTextStyles.titleLarge,
                      ),

                      // Flight number
                      AttributeLabelText(
                        name: 'Flight number: ',
                        value: launch.flightNumber.toString(),
                      ),

                      // Flight date
                      AttributeLabelText(
                        name: 'Flight date: ',
                        value: launch.date,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 14),

                // Chevron icon
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.chevron_right,
                      color: FigmaColors.lightBlue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
