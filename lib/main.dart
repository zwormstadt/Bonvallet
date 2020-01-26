import 'package:bonvallet/api/elastic.dart';
import 'package:bonvallet/search/search.dart';
import 'package:elastic_client/console_http_transport.dart';
import 'package:flutter/material.dart';
import 'package:elastic_client/elastic_client.dart' as elastic;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bonvallet',
      theme: ThemeData(
        primaryColor: Color(0xFF3416ba)
      ),
      home: MyHomePage(title: 'b o n v a l l e t'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    Elastic.insertDocument({});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w300,
            fontSize: 25
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SearchScreen(),
          ],
        ),
      ),
    );
  }
}
