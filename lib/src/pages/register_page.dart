import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/DatePicker.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:exFinal_analiza_T/src/components/OptionSelector.dart';
import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/API_provider.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:exFinal_analiza_T/src/utils/Validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
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
  String _sex = 'masculino';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Registro',
            style: TextStyle(
              fontSize: 30.0,
              color: MyColors.accentColor,
            ),
          ),
          SizedBox(height: 30),
          InputComponent(
            label: 'Nombre',
            validator: isFieldEmpty,
            keyBoardType: TextInputType.name,
            onChange: (val) => setState(() {
              _name = val;
            }),
          ),
          SizedBox(height: 20),
          _sexField(),
          SizedBox(height: 20),
          _birthDate(context),
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
            label: 'Contraseña',
            isPassword: true,
            validator: (value) {
              if (_repeatPass != value) return 'Los campos son distintos';
              return passValidator(value);
            },
            onChange: (val) => setState(() {
              _pass = val;
            }),
          ),
          SizedBox(height: 20),
          InputComponent(
            label: 'Repetir Contraseña',
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

  Future<void> _registerUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential cred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _pass);

        String formatedDate = DateFormat('dd-MM-yyyy').format(_date);
        UserModel user = UserModel(
          id: cred.user.uid,
          correo: _email,
          nombre: _name,
          fechaNacimiento: formatedDate,
          sexo: _sex,
        );

        bool result = await UserProvider().postUser(user);

        if (!result) return;

        Navigator.pushReplacementNamed(context, 'home');
      } catch (e) {
        print(e);
      }
    }
  }

  Widget _registerButton() {
    return Container(
      height: 50.0,
      width: 200.0,
      child: ButtonComponent(
        child: Text('Registrarse', style: TextStyle(fontSize: 25.0)),
        onPressed: _registerUser,
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      height: 50.0,
      width: 200.0,
      child: ButtonComponent(
        child: Text('Iniciar Sesión', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }

  Widget _sexField() {
    // Label
    // Values

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sexo:",
          style: TextStyle(fontSize: 18, color: MyColors.accentColor),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: OptionSelector<String>(
            value: _sex,
            options: {'Masculino': 'masculino', 'Femenino': 'femenino'},
            onChanged: (String newValue) {
              setState(() {
                _sex = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _birthDate(BuildContext context) {
    return FormField<DateTime>(
      validator: (value) {
        if (value == null) return 'No hay una fecha seleccionada';
        return null;
      },
      builder: (state) {
        return _dateField(state);
      },
    );
  }

  Container _dateField(FormFieldState<DateTime> state) {
    Widget _errorField(FormFieldState<DateTime> state) {
      if (state.hasError)
        return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            state.errorText,
            style: TextStyle(color: Colors.red),
          ),
        );

      return Container();
    }

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Fecha de Nacimiento',
            style: TextStyle(
              fontSize: 18,
              color: MyColors.accentColor,
            ),
          ),
          SizedBox(height: 10.0),
          DatePicker(
            initialDate: DateTime.now(),
            onDateSelected: (date) {
              state.didChange(date);
              setState(() {
                _date = date;
              });
            },
          ),
          _errorField(state)
        ],
      ),
    );
  }
}
