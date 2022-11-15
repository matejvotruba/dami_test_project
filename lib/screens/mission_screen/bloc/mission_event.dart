part of 'mission_bloc.dart';

abstract class MissionEvent extends Equatable {
  const MissionEvent();
}

class MissionAppStartEvent extends MissionEvent {
  const MissionAppStartEvent();

  @override
  List<Object> get props => [];
}

class MissionTryAgainEvent extends MissionEvent {
  const MissionTryAgainEvent();

  @override
  List<Object> get props => [];
}

class MissionFetchDataEvent extends MissionEvent {
  const MissionFetchDataEvent();

  @override
  List<Object> get props => [];
}
