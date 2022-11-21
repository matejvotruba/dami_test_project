import 'package:dami_test_project/styles.dart';
import 'package:dami_test_project/screens/mission_screen/mission_screen_appbar.dart';
import 'package:dami_test_project/widgets/error_screen_body.dart';
import 'package:dami_test_project/widgets/launch_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dami_test_project/screens/mission_screen/bloc/mission_bloc.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // appBarHeight based on the device
    final appBarHeight = 117 - MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) => MissionBloc()..add(const MissionAppStartEvent()),
      child: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          // Show Splash Screen
          if (state is MissionInitialState) {
            return Scaffold(
              backgroundColor: FigmaColors.baliBlue,
              body: Center(
                child: Image.asset('images/logo/dami_logo_white.png'),
              ),
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
              body: ErrorScreenBody(
                onTryAgainPressed: () {
                  context.read<MissionBloc>().add(const MissionTryAgainEvent());
                },
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
          }

          // Should not happen
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong with the Bloc'),
            ),
          );
        },
      ),
    );
  }
}
