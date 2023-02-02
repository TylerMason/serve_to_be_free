import 'package:flutter/material.dart';
import 'package:serve_to_be_free/bottomNavigationBar.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Serve to be Free')),
      body: Container(
        child: Text('This is home screen.'),
      ),
      bottomNavigationBar: MyStatefulWidget(),
    );
  }
}
