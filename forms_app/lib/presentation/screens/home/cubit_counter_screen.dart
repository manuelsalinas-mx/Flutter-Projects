import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state; // * * Forma 1 de consumir

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(child:
          // * * Forma 2 de consumir
          BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => current.counter != previous.counter,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${state.counter}',
                  style: const TextStyle(
                      fontSize: 200, fontWeight: FontWeight.w700)),
              const Text('Counter Value'),
            ],
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              elevation: 1.5,
              child: const Text('+3'),
              onPressed: () {
                // * * Forma 3 de consumir
                context.read<CounterCubit>().increaseBy(3);
              }),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              elevation: 1.5,
              child: const Text('+2'),
              onPressed: () {
                context.read<CounterCubit>().increaseBy(2);
              }),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              elevation: 1.5,
              child: const Text('+1'),
              onPressed: () {
                context.read<CounterCubit>().increaseBy(1);
              }),
        ],
      ),
    );
  }
}
