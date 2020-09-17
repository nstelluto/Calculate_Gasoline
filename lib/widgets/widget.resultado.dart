import 'package:flutter/material.dart';

class BoxResultado extends StatelessWidget {
  var resultado = '';
  Function funcao;

  BoxResultado({
    @required this.resultado,
    @required this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            this.resultado,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.all(30),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: this.funcao,
              child: Text(
                'VOLTAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
