import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../models/http_exception.dart';

//Author: Justin Wu

//This class creates the widget that is shown in the popup when a user wants to change their name.
class ChangeName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                "Change Name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 30),
              ChangeNameForm(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeNameForm extends StatefulWidget {
  @override
  ChangeNameFormState createState() {
    return ChangeNameFormState();
  }
}

class ChangeNameFormState extends State<ChangeNameForm> {
  final _formKey = GlobalKey<FormState>();
  var newFirstName;
  var newLastName;
  var createdMessage = "";
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      String name = this.newFirstName + " " + this.newLastName;
      try {
        await Provider.of<Auth>(context, listen: false).changeName(name);
        setState(() => createdMessage = "Name changed successfully!");
      } on HttpException catch (error) {
        var errorMessage = error.toString();
        setState(() => createdMessage = errorMessage);
      } catch (error) {
        print(error);
        const errorMessage = 'Could not authenticate. Try again later.';
        setState(() => createdMessage = errorMessage);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: formDecorator("enter first name"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your first name";
              }
              return null;
            },
            onSaved: (String value) {
              this.newFirstName = value.trim();
            },
          ),
          TextFormField(
            decoration: formDecorator("enter last name"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
            onSaved: (String value) {
              this.newLastName = value.trim();
            },
          ),
          SizedBox(height: 30),
          Row(children: [
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 40,
                color: Colors.cyanAccent[400],
                child: FlatButton(
                  child: Text(
                    "CHANGE NAME",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _submit();
                    }
                  },
                ),
              ),
            ),
            Spacer(),
          ]),
          SizedBox(height: 30),
          Text(
            createdMessage,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration formDecorator(String label) {
  return InputDecoration(
    labelText: label,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
  );
}
