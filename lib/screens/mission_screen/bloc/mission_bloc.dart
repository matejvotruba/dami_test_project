import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dami_test_project/models/rocket_launch.dart';
import 'package:dio/dio.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  MissionBloc() : super(const MissionInitialState()) {
    on<MissionAppStartEvent>(_showSplashScreen);
    on<MissionTryAgainEvent>(_showCircularProgressIndicator);
    on<MissionFetchDataEvent>(_fetchData);
  }

  void _showSplashScreen(
    MissionAppStartEvent event,
    Emitter<MissionState> emit,
  ) async {
    // SplashScreen duration = (1 sec + data fetching)
    await Future.delayed(const Duration(seconds: 1));
    add(const MissionFetchDataEvent());
  }

  void _showCircularProgressIndicator(
    MissionTryAgainEvent event,
    Emitter<MissionState> emit,
  ) async {
    emit(const MissionLoadingState());
    add(const MissionFetchDataEvent());
  }

  void _fetchData(
    MissionFetchDataEvent event,
    Emitter<MissionState> emit,
  ) async {
    try {
      // API Call
      final response =
          await Dio().get('https://api.spacexdata.com/v5/launches');
      final List data = response.data;

      // Create a list of RocketLaunch objects
      List<RocketLaunch> launches = [
        for (var e in data) RocketLaunch.fromJson(e)
      ];

      // Success State
      emit(MissionSuccessFetchDataState(launches: launches));
    } catch (e) {
      if (kDebugMode) print(e);

      // Error State
      emit(const MissionErrorFetchDataState());
    }
  }
}
