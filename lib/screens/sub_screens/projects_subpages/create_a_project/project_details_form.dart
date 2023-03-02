import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:serve_to_be_free/widgets/buttons/solid_rounded_button.dart';

class ProjectDetailsForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> privacyOptions = ['Friends', 'Public'];
  ProjectDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Creat a Project Demo'),
        ),
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
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FormBuilderTextField(
                        name: 'text_field',
                        decoration: InputDecoration(
                          hintText: 'Project Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
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
                      "Privacy",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FormBuilderDropdown<String>(
                        name: 'privacy',
                        decoration: InputDecoration(
                          hintText: 'Choose Privacy Level',
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   border:
                          //   borderRadius: BorderRadius.circular(10.0),
                          // ),
                          contentPadding: EdgeInsets.all(16),
                        ),
                        //Right here we just have to map it to make them DropdownMenuItems instead of strings
                        items: privacyOptions
                            .map((gender) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: gender,
                                  child: Text(gender),
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
                        child: SizedBox(
                          width: 100,
                          child: FormBuilderImagePicker(
                            name: "Project Image",
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            previewHeight: 100,
                            previewWidth: 100,
                            maxImages: 1,
                            onChanged: (value) => print(value),
                            onSaved: (value) => print(value),
                          ),
                        ),
                      ),
                    ),
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
                          width: 350,
                          height: 200,
                          child: FormBuilderTextField(
                            maxLines: null,
                            name: "Project Description",
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16.0),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "About your project..."
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(8.0),
                                // ),
                                ),
                            //onChanged: (value) => print(value),
                            //onSaved: (value) => print(value),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: SolidRoundedButton("Next", "path"),
              )
            ],
          ),
        ))));
  }
}
