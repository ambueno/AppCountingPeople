import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de pessoas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Contador de pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _currentClassStateMessage = "Chega mais :)";
  static const int _minStudents = 0;
  static const int _maxStudents = 36;

  void _incrementCounter() {
    setState(() {_counter++;});
    _checkCounter();
  }

  void _decrementCounter() {
    setState(() {_counter--;});
    _checkCounter();
  }

  void _checkCounter(){
    _checkIfCounterIsLessThanZero();
    _checkIfCounterIsMoreThanTotalOfStudents();
    _checkIfCounterIsInsideBoundaries();
  }

  void _checkIfCounterIsInsideBoundaries() { if(_counter >= _minStudents && _counter <= _maxStudents) _handleDefaultClassStateMessage(); }

  void _checkIfCounterIsLessThanZero() { if(_counter < _minStudents) _handleCounterIsLessThanZero(); }

  void _checkIfCounterIsMoreThanTotalOfStudents() { if(_counter >= _maxStudents) _handleCounterIsMoreThanTotalOfStudents(); }

  void _handleDefaultClassStateMessage() { setState(() {_currentClassStateMessage = "Chega mais :)";}); }

  void _handleCounterIsLessThanZero() { setState(() {_currentClassStateMessage = "Alunos negativos???? Wtf";}); }

  void _handleCounterIsMoreThanTotalOfStudents() { setState(() {_currentClassStateMessage = "Tem pc pra mais gente nao";}); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),
                    //textAlign: TextAlign.center,
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Alunos: $_counter',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                )
            ),
            Text(
                _currentClassStateMessage,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                )
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text(
                          '+1',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          )
                      ),
                    ),
                    const SizedBox(width: 24),
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: const Text(
                          '-1',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          )
                      ),
                    ),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
