import 'package:dio/dio.dart';
import 'package:dami_test_project/models/rocket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rocket_event.dart';
part 'rocket_state.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  RocketBloc() : super(const RocketInitialState()) {
    on<RocketFetchDataEvent>(_onFetchData);
  }

  void _onFetchData(
    RocketFetchDataEvent event,
    Emitter<RocketState> emit,
  ) async {
    emit(const RocketLoadingState());

    try {
      // API Call
      final response = await Dio()
          .get('https://api.spacexdata.com/v4/rockets/${event.rocketId}');
      final Map data = response.data;

      // Create Rocket object
      final Rocket rocket = Rocket(
        name: data['name'],
        description: data['description'],
        type: data['type'],
        stages: data['stages'],
        company: data['company'],
        boosters: data['boosters'],
        wikipediaUrl: data['wikipedia'],
      );

      // Show data
      emit(RocketSuccessFetchDataState(rocket: rocket));
    } catch (e) {
      // On error
      if (kDebugMode) {
        print(e);
      }

      // Show error screen
      emit(const RocketErrorFetchDataState());
    }
  }
}
