part of 'mission_bloc.dart';

abstract class MissionEvent extends Equatable {
  const MissionEvent();

  @override
  List<Object> get props => [];
}

class MissionAppStartEvent extends MissionEvent {
  const MissionAppStartEvent();
}

class MissionTryAgainEvent extends MissionEvent {
  const MissionTryAgainEvent();
}

class MissionFetchDataEvent extends MissionEvent {
  const MissionFetchDataEvent();
}
