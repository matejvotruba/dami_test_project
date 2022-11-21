part of 'rocket_bloc.dart';

abstract class RocketState extends Equatable {
  const RocketState();
}

class RocketInitialState extends RocketState {
  const RocketInitialState();

  @override
  List<Object> get props => [];
}

class RocketLoadingState extends RocketState {
  const RocketLoadingState();

  @override
  List<Object> get props => [];
}

class RocketErrorFetchDataState extends RocketState {
  const RocketErrorFetchDataState();

  @override
  List<Object> get props => [];
}

class RocketSuccessFetchDataState extends RocketState {
  const RocketSuccessFetchDataState({
    required this.rocket,
  });

  final Rocket rocket;

  @override
  List<Object> get props => [rocket];
}
