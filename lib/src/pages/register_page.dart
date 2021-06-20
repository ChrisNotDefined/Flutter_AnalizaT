import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:exFinal_analiza_T/src/utils/Validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
          child: _RegisterForm(),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  __RegisterFormState createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _name;
  DateTime _date;
  String _pass;
  String _repeatPass;
  String dropdownValue = 'M';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputComponent(
            label: 'Name',
            keyBoardType: TextInputType.name,
            onChange: (val) => setState(() {
              _name = val;
            }),
          ),
          SizedBox(height: 20),
          _comboboxSex(),
          SizedBox(height: 20),
          _datePicker(context),
          SizedBox(height: 20),
          InputComponent(
            label: 'E-mail',
            validator: emailValidator,
            keyBoardType: TextInputType.emailAddress,
            onChange: (val) => setState(() {
              _email = val;
            }),
          ),
          SizedBox(height: 20),
          InputComponent(
            label: 'Password',
            isPassword: true,
            validator: passValidator,
            onChange: (val) => setState(() {
              _pass = val;
            }),
          ),
          SizedBox(height: 20),
          InputComponent(
            label: 'Confirm Password',
            isPassword: true,
            onChange: (val) => setState(() {
              _repeatPass = val;
            }),
            validator: (value) {
              final lengthValidation = passValidator(value);
              if (lengthValidation != null) {
                return lengthValidation;
              }
              return value != _pass ? 'No match' : null;
            },
          ),
          SizedBox(height: 20),
          _registerButton(),
          SizedBox(height: 20),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      height: 50.0,
      width: 160.0,
      child: ButtonComponent(
        child: Text('Register', style: TextStyle(fontSize: 25.0)),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            try {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email, password: _pass);
              Navigator.pushNamed(context, 'test');
            } catch (e) {
              print(e);
            }
          }
        },
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      height: 50.0,
      width: 160.0,
      child: ButtonComponent(
        child: Text('Login', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }

  Widget _comboboxSex() {
    return Row(
      children: [
        Text("Genero:"),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items:
              <String>['M', 'F'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _datePicker(BuildContext context) {
    return ElevatedButton(
        child: Text("Select Date"),
        onPressed: () => {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1920),
                      lastDate: DateTime.now())
                  .then((date) => setState(() {
                        _date = date;
                      }))
            });
  }
}
