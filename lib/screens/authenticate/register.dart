import 'package:bonvallet/api/elastic.dart';
import 'package:bonvallet/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final Elastic _elastic = Elastic();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  final List<String> categories = [
    "Cooking",
    "Athletic",
    "Survival",
    "Marksmanship",
    "Academic",
    "Linguistic",
    "Relationship",
    "Business",
    "Musical",
    "Vocal",
    "Art",
    "Others"
  ];

  String firstName = '';
  String lastName = '';
  String name = '';
  String job = '';
  String skills = '';
  String value = '';

  final List<String> selectedValues = <String>[];

  // Here we create an object that eventually, we will save to Elasticsearch
  Map<String, dynamic> objToSave = {
    'name': '',
    'job': '',
    'skillset': []
  };

  // Here we create a function that can return a skill that can return a skill object dynamically,
  // which can then be added to the above object to be saved.
  Map<String, dynamic> buildOneSkill(String category, String skillsList) {
    return {
      'category': category,
      'skills': skillsList
    };
  }
 String _dropDownValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Bonvallet'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Email"
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState( () => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Password"
                ),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState( () => password = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"First Name"
                ),
                onChanged: (val) {
                  setState( () => firstName = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Last Name"
                ),
                onChanged: (val) {
                  setState( () => lastName = val);
                  setState( () => name = firstName + " " + lastName);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Job"
                ),
                onChanged: (val) {
                  setState( () => job = val);
                }
              ),
              SizedBox(height: 20.0),
              DropdownButton(
                hint: _dropDownValue == null
                    ? Text('Choose a Skillset')
                    : Text(
                        _dropDownValue,
                        style: TextStyle(color: Colors.blue),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.blue),
                items: categories.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val;
                    },
                  );
                },
              ),

              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Skills"
                ),
                onChanged: (val) {
                  setState( () => skills = '[' + val + ']');
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    this.objToSave['name'] = name;
                    this.objToSave['job'] = job;
                    this.objToSave['skillset'] = [this.buildOneSkill(_dropDownValue, skills)];
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() => error = 'Please supply a valid email');
                    }
                    //bool success = await _elastic.insertDocument(objToSave);
                    
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          )
        ),
      ),
    );
  }

  
}