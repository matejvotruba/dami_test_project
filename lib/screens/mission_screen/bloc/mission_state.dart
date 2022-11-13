part of 'mission_bloc.dart';

abstract class MissionState extends Equatable {
  const MissionState();

  @override
  List<Object> get props => [];
}

class MissionInitialState extends MissionState {
  const MissionInitialState();
}

class MissionLoadingState extends MissionState {
  const MissionLoadingState();
}

class MissionErrorFetchDataState extends MissionState {
  const MissionErrorFetchDataState({required this.errorMessage});

  final String errorMessage;
}

class MissionSuccessFetchDataState extends MissionState {
  const MissionSuccessFetchDataState({required this.launches});

  final List<RocketLaunch> launches;
}
