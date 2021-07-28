import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {
  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.Increment)
        counter++;
      else if (event == CounterAction.Decrement)
        counter--;
      else if (event == CounterAction.Reset) counter = 0;

      counterSink.add(counter);
    });
  }

  late int counter;

  final _eventStreamController = StreamController<CounterAction>();
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;

  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;

  Stream<CounterAction> get eventStream => _eventStreamController.stream;
}
