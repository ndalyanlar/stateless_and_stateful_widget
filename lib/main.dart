import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = "My App Home Page";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  late String title;
  @override
  void didChangeDependencies() {
    debugPrint("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    if (oldWidget.title != widget.title) {
      debugPrint("didUpdateWidget");
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    title = widget.title;
    debugPrint("initState");
    super.initState();
  }

  @override
  void deactivate() {
    debugPrint("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(title),
            ChangeTitleButtonWidget(
              title: title,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChangeTitleButtonWidget extends StatefulWidget {
  const ChangeTitleButtonWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<ChangeTitleButtonWidget> createState() =>
      _ChangeTitleButtonWidgetState();
}

class _ChangeTitleButtonWidgetState extends State<ChangeTitleButtonWidget> {
  @override
  void didUpdateWidget(covariant ChangeTitleButtonWidget oldWidget) {
    if (oldWidget.title != widget.title) {
      debugPrint("updated");
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(widget.title));
  }
}
