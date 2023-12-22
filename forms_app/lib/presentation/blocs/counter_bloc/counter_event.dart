part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int valor;

  const CounterIncreased(this.valor);
}

class CounterReset extends CounterEvent {}
