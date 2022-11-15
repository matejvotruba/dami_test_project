part of 'mission_bloc.dart';

abstract class MissionState extends Equatable {
  const MissionState();
}

class MissionInitialState extends MissionState {
  const MissionInitialState();

  @override
  List<Object> get props => [];
}

class MissionLoadingState extends MissionState {
  const MissionLoadingState();

  @override
  List<Object> get props => [];
}

class MissionErrorFetchDataState extends MissionState {
  const MissionErrorFetchDataState();

  @override
  List<Object> get props => [];
}

class MissionSuccessFetchDataState extends MissionState {
  const MissionSuccessFetchDataState({required this.launches});

  final List<RocketLaunch> launches;

  @override
  List<Object> get props => [launches];
}
