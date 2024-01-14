//export this file for bloc.dart
part of 'counter_bloc.dart';

class CounterEvent {}

//we have 2 events
class CountIncrement extends CounterEvent {}

class CountDecrement extends CounterEvent {}
