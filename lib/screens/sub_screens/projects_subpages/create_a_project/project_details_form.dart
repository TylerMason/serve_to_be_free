import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/widgets/buttons/solid_rounded_button.dart';

class ProjectDetailsForm extends StatefulWidget {
  final String _path; // private variable
  ProjectDetailsForm({Key? key, required String path})
      : _path = path, // initialize the private variable
        super(key: key);

  @override
  _ProjectDetailsFormState createState() => _ProjectDetailsFormState();
}

class _ProjectDetailsFormState extends State<ProjectDetailsForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<String> privacyOptions = ['Friends', 'Public'];

  Future<void> _submitForm() async {
    // a null check on here?
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      _formKey.currentState!.save();

      final bucketName = 'servetobefree-images';
      final region = 'us-east-1';
      final url = 'https://$bucketName.s3.$region.amazonaws.com';

      debugPrint(url);

      final response = await http.head(Uri.parse(url));

      print(_formKey.currentState!.value);
      final formData = _formKey.currentState!.value;
      final selectedFile = formData['projectImage'][0];
      if (selectedFile != null) {
        final file = File(selectedFile.path);
        //print(file);
        await uploadImageToS3(
            file, 'servetobefree-images', '1', 'testProfileImgae');
      }
      // Make it so the context only goes if the s3 upload is successful
      // context.go(widget._path);
    }
  }

  Future<void> uploadImageToS3(
      File imageFile, String bucketName, String userId, String imageFileName,
      {String region = 'us-east-1'}) async {
    final key = 'ServeToBeFree/ProfilePictures/$userId/$imageFileName';
    final url =
        'https://$bucketName.s3.amazonaws.com/$key'.replaceAll('+', '%20');
    final response = await http.put(Uri.parse(url),
        headers: {'Content-Type': 'image/jpeg'},
        body: await imageFile.readAsBytes());
    if (response.statusCode != 200) {
      throw Exception('Failed to upload image to S3');
    }
  }

  InputDecoration _fieldDecoration(_hintText) {
    return InputDecoration(
      hintText: _hintText,
      // For some reason this does not work if I am only styling one or two borders. So I specified all 4 down below.
      // border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: BorderSide.none),
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.grey[200],
      filled: true,
      // Many other way to customize this to make it feel interactive, otherwise the enabledBorder and the focusedBorder can just be deleted.
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: new OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      errorStyle: TextStyle(fontSize: 12, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Project Details'),
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
            )),
        body: SingleChildScrollView(
            child: Container(
                child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Name",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: FormBuilderTextField(
                          name: 'projectName',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(3),
                            FormBuilderValidators.maxLength(50),
                            FormBuilderValidators.match(
                              r'^[a-zA-Z0-9]+$',
                              errorText:
                                  'Only alphanumeric characters are allowed',
                            ),
                          ]),
                          decoration: _fieldDecoration("Project Name")),
                    )
                  ],
                ),
              ),
              Divider(
                //height: 1,
                color: Colors.grey,
                thickness: 0.5,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Privacy",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      // decoration: BoxDecoration(
                      //   color: Colors.grey[200],
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      child: FormBuilderDropdown<String>(
                        name: 'privacy',
                        decoration: _fieldDecoration("Project Privacy"),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        elevation: 2,
                        iconSize: 30,
                        isExpanded: true,
                        //Right here we just have to map it to make them DropdownMenuItems instead of strings
                        items: privacyOptions
                            .map((option) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: option,
                                  child: Text(option),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                //height: 1,
                color: Colors.grey,
                thickness: 0.5,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Photo",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        // child: Container(
                        //   width: 100,
                        child: FormBuilderImagePicker(
                          name: "projectImage",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            //errorText: 'Please select an image',
                            // errorBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   borderSide:
                            //       BorderSide(color: Colors.red, width: 2),
                            // ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Please select an Image',
                            ),
                          ]),

                          // previewHeight: 100,
                          // previewWidth: 100,
                          //previewAutoSizeWidth: true,
                          fit: BoxFit.cover,
                          maxImages: 1,
                        ),
                      ),
                    ),
                    //),
                  ],
                ),
              ),
              Divider(
                //height: 1,
                color: Colors.grey,
                thickness: 0.5,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Description",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // width: 350,
                          // height: 200,
                          child: FormBuilderTextField(
                            maxLines: null,
                            minLines: 10,
                            name: "projectDescription",
                            decoration:
                                _fieldDecoration("About your project..."),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 150,
              //   padding: EdgeInsets.only(bottom: 50),
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       backgroundColor: Colors.lightBlue[900],
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30.0),
              //       ),

              //       //side: BorderSide(width: 2.5, color: Colors.black),
              //     ),
              //     onPressed: _submitForm,
              //     child: Text(
              //       "Next",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18),
              //     ),
              //   ),
              // )
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child:
                      SolidRoundedButton("Next", passedFunction: _submitForm))
            ],
          ),
        ))));
  }
}
