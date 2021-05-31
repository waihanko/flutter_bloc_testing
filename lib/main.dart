
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/logic/bloc/counter_bloc.dart';
import 'package:flutter_bloc_testing/presentation/screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterScreenBloc>(
        create: (context) => CounterScreenBloc(),
        child: CounterScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
