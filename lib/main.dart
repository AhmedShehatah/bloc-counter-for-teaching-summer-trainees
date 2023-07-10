import 'package:counter_bloc/test/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  /// we use variable inside our BlocBuilder or BlocConsumer
  /// In advance inshallah we will see how to use this in DI (Dependncy Injection)
  final cubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                /// to tell BlocBuilder from where it takes its data
                bloc: cubit,
                builder: (context, state) {
                  /// we check which state emitted so
                  /// we change ui corresponding to it
                  ///
                  if (state is IncreaseState) {
                    var count = state.count;
                    return Text('increased $count');
                  } else if (state is DecreeseState) {
                    var count = state.count;
                    return Text('decrease $count');
                  }
                  return const Text('Init 0');
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    cubit.increase();
                  },
                  child: const Text('Increase')),
              ElevatedButton(
                  onPressed: () {
                    cubit.decrease();
                  },
                  child: const Text('Decrease')),
            ],
          ),
        ),
      ),
    );
  }
}
