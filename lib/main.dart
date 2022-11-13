import 'package:dami_test_project/screens/mission_screen/bloc/mission_bloc.dart';
import 'package:dami_test_project/screens/mission_screen/mission_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MissionBloc()..add(const MissionAppStartEvent()),
        child: const MissionScreen(),
      ),
    );
  }
}
