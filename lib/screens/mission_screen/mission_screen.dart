import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dami_test_project/screens/mission_screen/bloc/mission_bloc.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissionBloc, MissionState>(
      builder: (context, state) {
        if (state is MissionInitialState) {
          return Container();
        }

        if (state is MissionLoadingState) {
          return Container();
        }

        if (state is MissionErrorFetchDataState) {
          return Container();
        }

        if (state is MissionSuccessFetchDataState) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
