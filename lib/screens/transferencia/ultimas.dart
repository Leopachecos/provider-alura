import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas Transferências';

class ultimasTransferencias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_titulo, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    Consumer<Transferencias>(builder: (context, transferencias, child){
      final _ultimasTransferencias = transferencias.transferencias.reversed.toList();
      final _quantidade = transferencias.transferencias.length;
      int tamanho = 2;

      if (_quantidade == 0){
        return semTransferenciaCadastrada();
      }
      if (_quantidade < 2) {
        tamanho = _quantidade;
      }
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tamanho,
        shrinkWrap: true,
        itemBuilder: (context, indice){
          return ItemTransferencia(_ultimasTransferencias[indice]);
        },
      );
    }),
    ElevatedButton(
    child: Text('Ver todas as transferências'),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ListaTransferencias();
    }));
    },
    ),
      ],
    );
  }
}

class semTransferenciaCadastrada extends StatelessWidget {
  Widget build(BuildContext) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text('Voê ainda não cadastrou nenhuma transferência',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),),
      ),
    );
  }
}
