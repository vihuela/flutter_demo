import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      theme: ThemeData(primaryColor: Colors.red),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppPageState();
  }
}

class MyAppPageState extends State<MyAppPage> {
  String textToShow = "flutter 是很优秀的框架";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: Text(
          textToShow,
          style: TextStyle(fontFamily: "MyCustomFont",fontSize: 30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textToShow = "Flutter is Awesome!"; //textToShow一定要是类变量，不能是局部变量
          });
        },
        tooltip: "Update text",
        child: Icon(Icons.update),
      ),
    );
  }
}
