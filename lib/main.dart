import 'package:flutter/material.dart';

import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Bloc Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();
  Color primary = Color(0xff37464f);
  Color secondary = Color(0xff62717b);
  Color textColor = Color(0xffffffff);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(color: textColor),
                  ),
                  StreamBuilder(
                      stream: counterBloc.counterStream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data}',
                          style: TextStyle(color: textColor, fontSize: 32),
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.eventSink.add(CounterAction.Increment);
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.eventSink.add(CounterAction.Decrement);
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.eventSink.add(CounterAction.Reset);
                    },
                    tooltip: 'Reset',
                    child: Icon(Icons.loop),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
