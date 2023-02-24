import 'package:flutter/material.dart';

import '../widgets/ui/my_scaffold.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          height: 200.0,
          child: ListView(
            // This next line does the trick.
            /*
          Possible scrolling for overflow but it looks as if 
          the fit should be some 4 random friends? or favorite
          people? something like that.
        */
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ));
  }
}
