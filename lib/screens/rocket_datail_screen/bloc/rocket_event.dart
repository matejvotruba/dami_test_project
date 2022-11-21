part of 'rocket_bloc.dart';

abstract class RocketEvent extends Equatable {
  const RocketEvent();
}

class RocketFetchDataEvent extends RocketEvent {
  const RocketFetchDataEvent({
    required this.rocketId,
  });

  final String rocketId;

  @override
  List<Object> get props => [rocketId];
}
