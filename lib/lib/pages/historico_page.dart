// lib/pages/historico_page.dart
import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Recebimentos'),
      ),
      body: ListView.builder(
        itemCount: 10, // Exemplo de 10 itens de histórico
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
