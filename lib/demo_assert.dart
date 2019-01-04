import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Asset test",
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
  String textToShow = "I Like Flutter";
  String imgAssetPath = "images/demo1.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(imgAssetPath),
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
