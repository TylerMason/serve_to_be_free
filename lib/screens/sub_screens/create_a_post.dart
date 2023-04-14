import 'dart:io';

import 'package:flutter/material.dart';

class CreateAPost extends StatefulWidget {
  const CreateAPost({Key? key}) : super(key: key);

  @override
  _CreateAPostState createState() => _CreateAPostState();
}

class _CreateAPostState extends State<CreateAPost> {
  Map<String, dynamic> _selectedOption = {
    'text': 'Friends',
    'color': Colors.amberAccent,
    'icon': Icons.group_outlined
  }; // Default selected option

  Widget _buildListTile(Map<String, dynamic> option, int index,
      Function setStateCallback, BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          option['image'],
          fit: BoxFit.cover,
          height: 30,
          width: 30,
        ),
      ),
      title: Text(option['text']),
      onTap: () {
        setStateCallback(() {
          _selectedOption = option;
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create a Post'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 28, 72, 1.0),
                  Color.fromRGBO(35, 107, 140, 1.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      //padding: EdgeInsets.all(5),
                      child: _selectedOption['image'] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                _selectedOption['image'],
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.group_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amberAccent,
                              ),
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        _showOptionsDialog(); // Show the options dialog
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(_selectedOption[
                                'text']), // Display the selected option
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        maxLines:
                            null, // This will allow the text area to expand to fit the content.
                        decoration: InputDecoration(
                            hintText:
                                'Enter your text here', // Placeholder text for the text area
                            border:
                                InputBorder.none // Border around the text area
                            ),
                      )))
            ],
          ),
        ));
  }

  void _showOptionsDialog() {
    List<Map<String, dynamic>> options = [
      {
        'text': 'Friends',
        'color': Colors.amberAccent,
        'icon': Icons.group_outlined,
        'file': File('assets/images/curious_lemur.jpeg')
      },
      {'text': 'Friends', 'image': 'assets/images/curious_lemur.jpeg'},
      {'text': 'Group 1', 'image': 'assets/images/dude_fake.jpeg'},
      {'text': 'Group 2', 'image': 'assets/images/rock_racoon.jpeg'},
      {'text': 'Project 1', 'image': 'assets/images/shark_fake.jpeg'},
      {'text': 'Option 1', 'image': 'assets/images/curious_lemur.jpeg'}
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                // Display a colored container with an icon for the default tiles
                return ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    //padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.group_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.amberAccent,
                    ),
                  ),
                  title: Text(options[index]['text']),
                  onTap: () {
                    setState(() {
                      _selectedOption = options[index];
                    });
                    Navigator.pop(context);
                  },
                );
              } else {
                // Display an image and option text for the other options
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child:

                          //padding: EdgeInsets.all(5),
                          Image.asset(
                        options[index]['image'],
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      )),
                  title: Text(options[index]['text']),
                  onTap: () {
                    setState(() {
                      _selectedOption = options[index];
                    });
                  },
                );
              }
            },
          ),
        );
      },
    );

    // Update the selected option
    if (_selectedOption != null) {
      setState(() {
        _selectedOption = _selectedOption;
      });
    }
  }
}
