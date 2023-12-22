import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  // Local Increase & Reset methods
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) => Text('BloC Counter: ${counterBloc.state.transactionCount}')) ,
        actions: [
          IconButton(
            onPressed: () => resetCounter(context), 
            icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.select(
            (CounterBloc counterBloc) => Text('${counterBloc.state.counter}',
                style: const TextStyle(
                    fontSize: 200, fontWeight: FontWeight.w700)),
          ),
          const Text('Counter Value'),
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              elevation: 1.5,
              child: const Text('+3'),
              onPressed: () => increaseCounterBy(context, 3)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              elevation: 1.5,
              child: const Text('+2'),
              onPressed: () => increaseCounterBy(context, 2)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              elevation: 1.5,
              child: const Text('+1'),
              onPressed: () => increaseCounterBy(context)),
        ],
      ),
    );
  }
}
