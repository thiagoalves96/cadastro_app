import 'package:flutter/material.dart';

// Classe para representar um recebimento
class Recebimento {
  final String data;
  final String retiradaPor;
  final String beneficioDe;
  final String local;

  Recebimento(
      {required this.data,
      required this.retiradaPor,
      required this.beneficioDe,
      required this.local});

  factory Recebimento.fromJson(Map<String, dynamic> json) {
    return Recebimento(
      data: json['data'],
      retiradaPor: json['retiradaPor'],
      beneficioDe: json['beneficioDe'],
      local: json['local'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'retiradaPor': retiradaPor,
      'beneficioDe': beneficioDe,
      'local': local,
    };
  }
}

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recebimento> recebimentos = [
      Recebimento(
          data: '01/01/2023',
          retiradaPor: 'Maria Aparecida',
          beneficioDe: 'Cesta Básica',
          local: 'R. Antonio Luis, 53 - SP'),
      Recebimento(
          data: '01/02/2023',
          retiradaPor: 'Maria Aparecida',
          beneficioDe: 'Cesta Básica',
          local: 'R. Antonio Luis, 53 - SP'),
      Recebimento(
          data: '01/03/2023',
          retiradaPor: 'Maria Aparecida',
          beneficioDe: 'Cesta Básica',
          local: 'R. Antonio Luis, 53 - SP'),
      Recebimento(
          data: '01/03/2023',
          retiradaPor: 'Maria Aparecida',
          beneficioDe: 'Sacolão de legumes',
          local: 'R. Antonio Luis, 53 - SP'),
      Recebimento(
          data: '01/04/2023',
          retiradaPor: 'Maria Aparecida',
          beneficioDe: 'Cesta Básica',
          local: 'R. Antonio Luis, 53 - SP'),
      // Adicione mais recebimentos aqui conforme necessário
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Recebimentos'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: recebimentos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Data do Recebimento:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(recebimentos[index].data),
                  const SizedBox(height: 8),
                  const Text("Retirada por:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(recebimentos[index].retiradaPor),
                  const SizedBox(height: 8),
                  const Text("Benefício:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(recebimentos[index].beneficioDe),
                  const SizedBox(height: 8),
                  const Text("Local:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(recebimentos[index].local),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
