// beneficio_page.dart
import 'package:flutter/material.dart';

class BeneficioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benefício'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome da OSC',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Endereço fictício: Rua das Flores, 123, São Paulo, SP',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Agendamento da retirada do benefício:'),
                  subtitle: Text('Data: 0${index + 1}/01/2023 - Hora: 10:00'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
