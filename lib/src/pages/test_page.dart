import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/FormRowComponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:exFinal_analiza_T/src/components/LoadingIndicatorComponent.dart';
import 'package:exFinal_analiza_T/src/models/result_model.dart';
import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:exFinal_analiza_T/src/utils/Validators.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<ApplicationState>(context).isLoadingAnalysis;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: Stack(
          children: [
            SingleChildScrollView(child: _TestForm()),
            isLoading ? LoadingIndicator() : Container()
          ],
        ),
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

  ResultModel result = new ResultModel();
  double _hdl = 0.0;
  double _ldl = 0.0;
  double _trigliceridos = 0.0;
  double _hemoglobina = 0.0;
  double _acidoUrico = 0.0;
  double _glucosa = 0.0;
  double _globulosRojos = 0.0;
  double _globulosBlancos = 0.0;
  double _plaquetas = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Llene los campos y verifique que sean las mismas unidades.',
              style: TextStyle(color: MyColors.accentColor, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            _cholesterolField(),
            FormRow(
              label: 'Triglicéridos:',
              unit: 'mg / dl',
              onChange: (value) => setState(() {
                _trigliceridos = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Ácido Úrico:',
              unit: 'mg / dl',
              onChange: (value) => setState(() {
                _acidoUrico = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Glucosa:',
              unit: 'mg / dl',
              onChange: (value) => setState(() {
                _glucosa = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Glóbulos Rojos:',
              unit: 'millones / dl',
              onChange: (value) => setState(() {
                _globulosRojos = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Glóbulos Blancos:',
              unit: 'miles / dl',
              onChange: (value) => setState(() {
                _globulosBlancos = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Plaquetas:',
              unit: 'miles / dl',
              onChange: (value) => setState(() {
                _plaquetas = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Hemoglobina:',
              unit: 'g / dl',
              onChange: (value) => setState(() {
                _hemoglobina = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            SizedBox(height: 50),
            _CalcButton(
              onPress: () {
                uploadTest();
              },
            ),
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
      final state = Provider.of<ApplicationState>(context, listen: false);
      UserModel user = state.user;
      try {
        ResultModel result = state.currentAnalysis;
        ResultModel newResult = new ResultModel();
        newResult.idUsuario = user.id;
        newResult.acidoUrico = _acidoUrico;
        newResult.trigliceridos = _trigliceridos;
        newResult.glucosa = _glucosa;
        newResult.globulosRojos = _globulosRojos;
        newResult.globulosBlancos = _globulosBlancos;
        newResult.plaquetas = _plaquetas;
        newResult.hemoglobina = _hemoglobina;
        newResult.colesterol = new ColesterolModel();
        newResult.colesterol.ldl = _ldl;
        newResult.colesterol.hdl = _hdl;

        if (result == null) {
          print("Entro al post");
          state.uploadAnalysis(newResult);
        } else {
          print("Entro al put");
          newResult.idUsuario = user.id;
          state.uploadAnalysis(newResult, isNew: true);
        }

        Provider.of<ApplicationState>(context, listen: false).fetchAnalysis();
        Navigator.of(context).pushReplacementNamed('results');
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
                label: 'HDL (mg / dl)',
                onChange: (value) => setState(() {
                  _hdl = double.tryParse(value);
                }),
                validator: isValidDouble,
                keyBoardType: TextInputType.number,
              )),
              SizedBox(width: 20.0),
              Expanded(
                  child: InputComponent(
                label: 'LDL (mg / dl)',
                onChange: (value) => setState(() {
                  _ldl = double.tryParse(value);
                }),
                validator: isValidDouble,
                keyBoardType: TextInputType.number,
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalcButton extends StatelessWidget {
  final void Function() onPress;
  const _CalcButton({Key key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: ButtonComponent(
        child: Text('Ver resultados', style: TextStyle(fontSize: 25.0)),
        onPressed: this.onPress,
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
      width: double.infinity,
      child: ButtonComponent(
        child: Text('Volver', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
