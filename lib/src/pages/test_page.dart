import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/FormRowComponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:exFinal_analiza_T/src/models/result_model.dart';
import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/API_provider.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: SingleChildScrollView(child: _TestForm()),
      ),
    );
  }
}

class _TestForm extends StatefulWidget {
  _TestForm({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<_TestForm> {
  final _formKey = new GlobalKey<FormState>();

  double _hdl = 0.0;
  double _ldl = 0.0;
  double _trigliceridos = 0.0;
  double _hemoglobina = 0.0;
  double _acidoUrico = 0.0;
  double _glucosa = 0.0;
  double _globulosRojos = 0.0;
  double _globulosBlancos = 0.0;
  double _plaquetas = 0.0;

  UserModel user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<ApplicationState>(context).user;

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _cholesterolField(),
            FormRow(label: 'Triglicéridos:', unit: 'mg / dl'),
            FormRow(
              label: 'Ácido Úrico:',
              unit: 'mg / dl',
            ),
            FormRow(label: 'Glucosa:', unit: 'mg / dl'),
            FormRow(label: 'Glóbulos Rojos:', unit: 'millones / dl'),
            FormRow(label: 'Glóbulos Blancos:', unit: 'miles / dl'),
            FormRow(label: 'Plaquetas:', unit: 'miles / dl'),
            FormRow(label: 'Hemoglobina:', unit: 'g / dl'),
            SizedBox(height: 50),
            _CalcButton(),
            SizedBox(height: 10),
            _BackButton(),
          ],
        ),
      ),
    );
  }

  Future<void> uploadTest() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        ResultModel result = await ResultProvider().getResultByUserId(user.id);
        if (result == null) {
          result.idUsuario = user.id;
          result.acidoUrico = _acidoUrico;
          result.trigliceridos = _trigliceridos;
          result.glucosa = _glucosa;
          result.globulosRojos = _globulosRojos;
          result.globulosBlancos = _globulosBlancos;
          result.plaquetas = _plaquetas;
          result.hemoglobina = _hemoglobina;
          result.colesterol.ldl = _ldl;
          result.colesterol.hdl = _hdl;
          bool response = await ResultProvider().postResult(result);

          if (!response) return;
        } else {
          result.acidoUrico = _acidoUrico;
          result.trigliceridos = _trigliceridos;
          result.glucosa = _glucosa;
          result.globulosRojos = _globulosRojos;
          result.globulosBlancos = _globulosBlancos;
          result.plaquetas = _plaquetas;
          result.hemoglobina = _hemoglobina;
          result.colesterol.ldl = _ldl;
          result.colesterol.hdl = _hdl;
          bool response = await ResultProvider().putResult(result);

          if (!response) return;
        }
        Navigator.of(context).pushNamed('results');
      } catch (error) {
        print('FAILDED UPLOAD');
        print(error);
      }
    }
  }

  Widget _cholesterolField() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Colesterol:',
            style: TextStyle(
              color: MyColors.accentColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                  child: InputComponent(
                label: 'HDL',
              )),
              SizedBox(width: 20.0),
              Expanded(
                  child: InputComponent(
                label: 'LDL',
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalcButton extends StatelessWidget {
  const _CalcButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 200.0,
      child: ButtonComponent(
        child: Text('Ver resultados', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pushNamed(context, 'results');
        },
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 200.0,
      child: ButtonComponent(
        child: Text('Volver', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
