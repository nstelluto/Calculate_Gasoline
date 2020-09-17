import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Formulario extends StatelessWidget {
  Function funcao;
  var ctrAlcool = new MoneyMaskedTextController();
  var ctrGasolina = new MoneyMaskedTextController();
  Formulario({
    @required this.funcao,
    @required this.ctrAlcool,
    @required this.ctrGasolina,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 120,
              alignment: Alignment.centerRight,
              child: Text(
                'ÁLCOOL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: this.ctrAlcool,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Big Shoulders Display",
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              width: 120,
              alignment: Alignment.centerRight,
              child: Text(
                'GASOLINA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: this.ctrGasolina,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: "Big Shoulders Display",
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(30),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(60),
          ),
          child: FlatButton(
            onPressed: this.funcao,
            child: Text(
              'CALCULAR',
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Big Shoulders Display",
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
