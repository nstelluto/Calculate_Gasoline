import 'package:aula07/widgets/widget.form.dart';
import 'package:aula07/widgets/widget.resultado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Álcool ou Gasolina',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Álcool ou Gasolina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ctrAlcool = new MoneyMaskedTextController();
  var _ctrGasolina = new MoneyMaskedTextController();
  // var _ocupado = false;
  var _finalizado = false;
  var _resultado = 'AGUARDE...';
  Color _color;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    this._color = Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this._color,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1600,
        ),
        color: this._color,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset("assets/images/aog-white.png"),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Álcool ou Gasolina',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Big Shoulders Display",
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
            this._finalizado
                ? BoxResultado(
                    resultado: this._resultado,
                    funcao: limpar,
                  )
                : Formulario(
                    funcao: calcular,
                    ctrAlcool: _ctrAlcool,
                    ctrGasolina: _ctrGasolina,
                  )
          ],
        ),
      ),
    );
  }

  limpar() {
    setState(() {
      _ctrAlcool = new MoneyMaskedTextController();
      _ctrGasolina = new MoneyMaskedTextController();
      this._finalizado = false;
    });
  }

  Future calcular() {
    double alcool = double.parse(_ctrAlcool.text.replaceAll(',', '.'));
    double gasolina = double.parse(_ctrGasolina.text.replaceAll(',', '.'));
    double resultado = (alcool / gasolina);

    setState(() {
      _color = Theme.of(context).primaryColorLight;
    });
    return new Future.delayed(Duration(seconds: 3), () {
      setState(() {
        if (resultado >= 0.7) {
          this._resultado = 'COMPENSA GASOLINA';
        } else {
          this._resultado = 'COMPENSA ÁLCOOL';
        }
        this._finalizado = true;
        _color = Theme.of(context).primaryColor;
      });
    });
  }
}
