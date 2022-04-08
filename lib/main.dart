import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carlo Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Carlo Demo Application'),
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
  List<String> sampleList = [];
  TextEditingController sampleInputController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: addButtonWidget(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(color: Colors.white, width: MediaQuery.of(context).size.height, height: MediaQuery.of(context).size.height, child: listWidget()));
  }

  ////////////////////////////////WIDGETS///////////////////////////////////////////////////////////////////////////////////

  Widget addButtonWidget() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showInputDialog();
      },
    );
  }

  Widget listWidget() {
    return Column(children: [for (int i = 0; i < sampleList.length; i++) ListTile(title: Text(sampleList[i]))]);
  }

  Widget dialogWidget() {
    return AlertDialog(
      title: const Text('Add Something to the list'),
      content: TextFormField(controller: sampleInputController),
      actions: <Widget>[
        TextButton(
          child: const Text('Add Item'),
          onPressed: () {
            setState(() {
              sampleList.add(sampleInputController.text.trim());
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  ////////////////////////////////FUNCTIONS////////////////////////////////////////////////////////////////////////////////
  Future<void> showInputDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialogWidget();
      },
    );
  }
}
