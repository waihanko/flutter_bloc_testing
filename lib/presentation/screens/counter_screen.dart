import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/logic/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  final String? title;

  CounterScreen({this.title});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterScreenBloc? _counterScreenBloc;

  @override
  void dispose() {
    _counterScreenBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Initialize bloc in the build method
    _counterScreenBloc = BlocProvider.of<CounterScreenBloc>(context);

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<CounterScreenBloc, CounterScreenState>(
        builder: (context, state) {
      print("HIT IT");

      if (state is LoadingCounter) {
        print("triggered state");

        ///!! Show Loading Screen
        return buildLoadingScreen();
      } else if (state is ShowCounterValue) {
        print("SHOW COUNTER VALUE");

        /// Show Counter Value
        return buildCounterScreen(state.counterValue);
      } else {
        print("ELSE");

        /// Just returning an empty container
        return Container();
      }
    });
  }

  Widget buildCounterScreen(int counterValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          counterValue.toString(),
          style: Theme.of(context).textTheme.display1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: _randomCounter,
                tooltip: 'Random',
                child: Icon(Icons.shuffle),
              )
            ],
          ),
        )
      ],
    );
  }

  void _incrementCounter() {
    print("increment call in ui");
    _counterScreenBloc!.add(IncrementValue());
  }

  void _randomCounter() {
    print("random call in ui");
    _counterScreenBloc!.add(RandomNumberValue());
  }

  void _decrementCounter() {
    print("decrement call in ui");
    _counterScreenBloc!.add(DecrementValue());
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Counter Bloc Example"),
    );
  }

  Widget buildLoadingScreen() {
    return Center(child: CircularProgressIndicator());
  }
}
