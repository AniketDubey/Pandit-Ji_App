// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'HomePageScreen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:panditjiapp/models/DUMMYDATA.dart';
import 'package:panditjiapp/models/Station.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);

  String sta;
  Map<String, String> details;
  HomePage(this.sta, this.details);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: TypeAheadFormField(
          suggestionsCallback: (pattern) {
            return sList.where(
              (items) => items.sName.toLowerCase().startsWith(
                    pattern.toLowerCase(),
                  ),
            );
          },
          itemBuilder: (_, Station suggestion) {
            return ListTile(
              title: Text(
                suggestion.sName.toString(),
              ),
            );
          },
          getImmediateSuggestions: true,
          hideSuggestionsOnKeyboardHide: false,
          hideOnEmpty: false,
          noItemsFoundBuilder: (context) {
            return const Padding(
              padding: EdgeInsets.all(8),
              child: Text("No Items Found"),
            );
          },
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              hintText: sta,
            ),
            controller: this._textEditingController,
          ),
          onSuggestionSelected: (Station val) {
            this._textEditingController.text = val.sName.toString();
            if (sta == "Source Station")
              details["Source"] = val.sName.toString();
            else
              details["Destination"] = val.sName.toString();
          },
        ),
      ),
    );
  }
}
