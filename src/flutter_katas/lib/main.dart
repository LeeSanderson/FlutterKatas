import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';

  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Text(
                  answer,
                  style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      child: Text(buttons[index]),
                    );
                  }

                  // +/- button
                  else if (index == 1) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      child: Text(buttons[index]),
                    );
                  }
                  // % Button
                  else if (index == 2) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      child: Text(buttons[index]),
                    );
                  }
                  // Delete Button
                  else if (index == 3) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userInput = userInput.substring(0, userInput.length - 1);
                        });
                      },
                      child: Text(buttons[index]),
                    );
                  }
                  // Equal_to Button
                  else if (index == 18) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      child: Text(buttons[index]),
                    );
                  }

                  //  other buttons
                  else {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      child: Text(buttons[index]),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  // function to calculate the input operation
  void equalPressed() {
    throw UnimplementedError();
  }
}
