// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/mission_screen/mission_screen.dart' as _i1;
import '../screens/rocket_datail_screen/rocket_detail_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MissionScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MissionScreen(),
      );
    },
    RocketDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RocketDetailScreenRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.RocketDetailScreen(
          key: args.key,
          rocketId: args.rocketId,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MissionScreenRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          RocketDetailScreenRoute.name,
          path: '/rocket-detail-screen',
        ),
      ];
}

/// generated route for
/// [_i1.MissionScreen]
class MissionScreenRoute extends _i3.PageRouteInfo<void> {
  const MissionScreenRoute()
      : super(
          MissionScreenRoute.name,
          path: '/',
        );

  static const String name = 'MissionScreenRoute';
}

/// generated route for
/// [_i2.RocketDetailScreen]
class RocketDetailScreenRoute
    extends _i3.PageRouteInfo<RocketDetailScreenRouteArgs> {
  RocketDetailScreenRoute({
    _i4.Key? key,
    required String rocketId,
  }) : super(
          RocketDetailScreenRoute.name,
          path: '/rocket-detail-screen',
          args: RocketDetailScreenRouteArgs(
            key: key,
            rocketId: rocketId,
          ),
        );

  static const String name = 'RocketDetailScreenRoute';
}

class RocketDetailScreenRouteArgs {
  const RocketDetailScreenRouteArgs({
    this.key,
    required this.rocketId,
  });

  final _i4.Key? key;

  final String rocketId;

  @override
  String toString() {
    return 'RocketDetailScreenRouteArgs{key: $key, rocketId: $rocketId}';
  }
}
