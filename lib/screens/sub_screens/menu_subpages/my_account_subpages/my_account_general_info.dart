import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyAccountGeneralInfo extends StatefulWidget {
  const MyAccountGeneralInfo({super.key});

  @override
  State<MyAccountGeneralInfo> createState() => _MyAccountGeneralInfoState();
}

class _MyAccountGeneralInfoState extends State<MyAccountGeneralInfo> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<String> privacyOptions = ['Friends', 'Public'];

  void _submitForm() {
    // a null check on here?
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // Get the value of each form field and add it to the _formData map
      _formKey.currentState!.save();
      debugPrint(_formKey.currentState!.value.toString());
      // Do something with the form data
      print(_formKey.currentState!.value);
      //context.go(widget._path);
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
          title: const Text('Create a Project Demo'),
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
            ],
          ),
        ))));
  }
}
