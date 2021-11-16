import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: ListView(children: <Widget>[
          Align(alignment: Alignment.topCenter, child: SaldoCard()),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton(
              child: Text('Receber depósito'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Deposito();
                }));
              },
            ),
            ElevatedButton(
              child: Text('Receber Transferência'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormularioTransferencia();
                }));
              },
            )
          ]),ultimasTransferencias(),
        ]));
  }
}
