import 'package:flutter/material.dart';
import 'package:serve_to_be_free/screens/dashboard.dart';
import 'package:serve_to_be_free/screens/groups.dart';
import 'package:serve_to_be_free/screens/messages.dart';
import 'package:serve_to_be_free/screens/projects.dart';
import 'package:serve_to_be_free/screens/tasks.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> body = <Widget>[
    DashboardPage(),
    ProjectsPage(),
    GroupsPage(),
    TasksPage(),
    MessagesPage(),
    GroupsPage()
  ];
  //late int appIndex = NavBar.currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // boolTrue ? AppBar(title: Text('Serve to be Free')) : null,
        /*
          The above line could be a good option for the profile pic by nullifying
          the appBar to make room for a background photo... Just trying to figure
          out how to change the "boolean" variable from a different widget... or 
          if we navigate to the profile page
        */
        appBar: AppBar(title: Text('Serve to be Free')),

        /*
          Takes one of our many widgets in our List above and puts it
          in a scrollable view... Can be changed depending on how we
          structure each view if they need more space or less.
        */
        body: SingleChildScrollView(child: body[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.groups_2_outlined),
                label: 'Groups',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task_outlined),
                label: 'My Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red[800],
            onTap: _onItemTapped));
  }
}
