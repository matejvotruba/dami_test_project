import 'package:auto_route/auto_route.dart';
import 'package:dami_test_project/screens/mission_screen/mission_screen.dart';
import 'package:dami_test_project/screens/rocket_datail_screen/rocket_detail_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: MissionScreen,
      initial: true,
    ),
    AutoRoute(page: RocketDetailScreen),
  ],
)
class $AppRouter {}
