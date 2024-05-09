import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Recebimentos'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Recebimento ${index + 1}'),
            subtitle: Text('Descrição do recebimento ${index + 1}'),
          );
        },
      ),
    );
  }
}
