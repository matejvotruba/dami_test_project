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
    // Loading state
    emit(const RocketLoadingState());

    try {
      // API Call
      final response = await Dio()
          .get('https://api.spacexdata.com/v4/rockets/${event.rocketId}');
      final Map<String, dynamic> data = response.data;

      // Create Rocket object
      final rocket = Rocket.fromJson(data);

      // Show data
      emit(RocketSuccessFetchDataState(rocket: rocket));

      // On error
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      // Show error screen
      emit(const RocketErrorFetchDataState());
    }
  }
}
