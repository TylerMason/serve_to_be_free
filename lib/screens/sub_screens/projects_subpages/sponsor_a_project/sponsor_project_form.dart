import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SponsorProjectForm extends StatefulWidget {
  final String? projectId;

  const SponsorProjectForm({Key? key, required this.projectId})
      : super(key: key);

  @override
  _SponsorProjectFormState createState() => _SponsorProjectFormState();
}

class _SponsorProjectFormState extends State<SponsorProjectForm> {
  Map<String, dynamic> projectData = {};
  TextEditingController _amountController = TextEditingController();

  Future<Map<String, dynamic>> getProject() async {
    var url =
        Uri.parse('http://44.203.120.103:3000/projects/${widget.projectId}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  void initState() {
    super.initState();
    getProject().then((data) {
      setState(() {
        projectData = data;
      });
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsor Project'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (projectData.containsKey('projectPicture') &&
                projectData['projectPicture'].isNotEmpty)
              Image.network(
                projectData['projectPicture'],
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            SizedBox(height: 20),
            Text(
              projectData['name'] ?? '',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            if (projectData.containsKey('description'))
              Center(
                child: Text(
                  '${projectData['description']}',
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(height: 20),
            Container(
              width: 200,
              child: TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  prefixText: '\$',
                  labelText: 'Sponsorship Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit Sponsorship'),
            ),
          ],
        ),
      ),
    );
  }
}
