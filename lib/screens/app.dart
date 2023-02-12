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
  //bool _showAppBarHeader = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /* 
  This object is my attempt in creating a dynamic appbar header but we will
  be able to consider other options when it comes to changing the layout in 
  a more dynamic way possibly.
  */
  static List<PreferredSizeWidget> _appBarHeaderOptions = <PreferredSizeWidget>[
    PreferredSize(
      preferredSize: Size(double.infinity, 114),
      child: AppBar(
          centerTitle: false,
          title: Column(children: <Widget>[
            Text(
              'My App',
              style: TextStyle(
                  color: Colors.black12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 32),
            ),
            Text("My second text"),
          ])),
    ),
  ];

  static const List<BottomNavigationBarItem> BottomNavBarItems =
      <BottomNavigationBarItem>[
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
  ];

  static const List<Widget> body = <Widget>[
    DashboardPage(),
    ProjectsPage(),
    GroupsPage(),
    TasksPage(),
    MessagesPage(),
    GroupsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // boolTrue ? AppBar(title: Text('Serve to be Free')) : null,
        /*
          The above line could be a good option for the profile pic by nullifying
          the appBar to make room for a background photo... Just trying to figure
          out how to change the "boolean" variable from a different widget... or 
          if we navigate to the profile page.

          This is also being considered in an object above called appBarHeaderOptions
          on th eline below because the SliverAppBar widget is looking like the closest possibility 
          to making our profile page look more like the invision profile page layout.
        */
        appBar: _appBarHeaderOptions[0],

        /*
          Takes one of our many widgets in our List above and puts it
          in a scrollable view... Can be changed depending on how we
          structure each view if they need more space or less. So far seems like
          the best option... Could be changed to something else if it fits our
          needs better. But thats my best understanding so far.
        */
        body: SingleChildScrollView(child: body[_selectedIndex]),

        /*
        Maybe need to figure out how to deal with the menu (Far right nav button).
        I think the best solution so far would be to use MaterialPageRoute because
        that give us use of the back button by making the menu items easy to navigate
        back to from the profile, but also use the profile page by itself when clicked on
        from somewhere else... It would also really only be needed for a person's
        personal profile and not someone else's.
        */

        bottomNavigationBar: BottomNavigationBar(
            items: [for (var navItem in BottomNavBarItems) navItem],
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red[800],
            onTap: _onItemTapped));
  }
}
