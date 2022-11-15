import 'package:dami_test_project/models/rocket_launch.dart';
import 'package:dami_test_project/styles.dart';
import 'package:dami_test_project/screens/mission_screen/mission_screen_appbar.dart';
import 'package:dami_test_project/widgets/dami_material_button.dart';
import 'package:dami_test_project/widgets/launch_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dami_test_project/screens/mission_screen/bloc/mission_bloc.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = 117 - MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) => MissionBloc()..add(const MissionAppStartEvent()),
      child: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          // Show Splash Screen
          if (state is MissionInitialState) {
            return Scaffold(
              backgroundColor: FigmaColors.baliBlue,
              body:
                  Center(child: Image.asset('images/logo/dami_logo_white.png')),
            );
          }

          // Show CircularProgressIndicator
          if (state is MissionLoadingState) {
            return Scaffold(
              appBar: MissionScreenAppBar(appBarHeight: appBarHeight),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          // Show Error and Try Again button
          if (state is MissionErrorFetchDataState) {
            return Scaffold(
              appBar: MissionScreenAppBar(appBarHeight: appBarHeight),
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
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: DamiMaterialButton(
                        text: 'TRY AGAIN',
                        onPressed: () {
                          context
                              .read<MissionBloc>()
                              .add(const MissionTryAgainEvent());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Show list of launches
          if (state is MissionSuccessFetchDataState) {
            return Scaffold(
              appBar: MissionScreenAppBar(appBarHeight: appBarHeight),
              body: ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (context, i) {
                  final launch = state.launches[i];
                  return LaunchTile(launch: launch);
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
