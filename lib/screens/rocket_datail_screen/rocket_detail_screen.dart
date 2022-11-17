import 'package:dami_test_project/screens/rocket_datail_screen/bloc/rocket_bloc.dart';
import 'package:dami_test_project/screens/rocket_datail_screen/rocket_detail_screen_appbar.dart';
import 'package:dami_test_project/styles.dart';
import 'package:dami_test_project/widgets/attribute_label_text.dart';
import 'package:dami_test_project/widgets/dami_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailScreen extends StatelessWidget {
  const RocketDetailScreen({super.key, required this.rocketId});

  final String rocketId;

  @override
  Widget build(BuildContext context) {
    final appBarHeight = 96 - MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) =>
          RocketBloc()..add(RocketFetchDataEvent(rocketId: rocketId)),
      child: BlocBuilder<RocketBloc, RocketState>(
        builder: (context, state) {
          // Show loading indicator
          if (state is RocketLoadingState) {
            return Scaffold(
              appBar: RocketDetailScreenAppBar(
                appBarHeight: appBarHeight,
                title: 'Loading...',
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          // Show error message and try again button
          if (state is RocketErrorFetchDataState) {
            return Scaffold(
              appBar: RocketDetailScreenAppBar(
                appBarHeight: appBarHeight,
                title: 'Error',
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'DATA DOWNLOAD\n'
                      'FAILED',
                      style: FigmaTextStyles.titleLarge.copyWith(
                        color: FigmaColors.lightBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: DamiMaterialButton(
                        text: 'TRY AGAIN',
                        onPressed: () {
                          context
                              .read<RocketBloc>()
                              .add(RocketFetchDataEvent(rocketId: rocketId));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Show data
          if (state is RocketSuccessFetchDataState) {
            return Scaffold(
              appBar: RocketDetailScreenAppBar(
                appBarHeight: appBarHeight,
                title: state.rocket.name,
              ),
              body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Rocket description
                    Text(
                      state.rocket.description,
                      style: FigmaTextStyles.bodyMedium,
                    ),

                    const SizedBox(height: 24),

                    // Rocket attributes
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AttributeLabelText(
                                value: state.rocket.type,
                                name: 'Type: ',
                              ),
                              AttributeLabelText(
                                value: state.rocket.stages.toString(),
                                name: 'Stages: ',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AttributeLabelText(
                                value: state.rocket.company,
                                name: 'Company: ',
                              ),
                              AttributeLabelText(
                                value: state.rocket.boosters.toString(),
                                name: 'Boosters: ',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Wikipedia button
                    DamiMaterialButton(
                      text: 'WIKIPEDIA',
                      onPressed: () async {
                        final Uri url = Uri.parse(state.rocket.wikipediaUrl);
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw 'Could not launch $url';
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
