import 'package:flutter/material.dart';

// Classe para representar um benefício
class Beneficio {
  final String nome;
  final String descricao;
  final String endereco;
  final DateTime data;
  final String horario;
  final bool retirado;

  Beneficio({
    required this.nome,
    required this.descricao,
    required this.endereco,
    required this.data,
    required this.horario,
    required this.retirado,
  });

  factory Beneficio.fromJson(Map<String, dynamic> json) {
    return Beneficio(
      nome: json['nome'],
      descricao: json['descricao'],
      endereco: json['endereco'],
      data: DateTime.parse(json['data']),
      horario: json['horario'],
      retirado: json['retirado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'endereco': endereco,
      'data': data.toIso8601String(),
      'horario': horario,
      'retirado': retirado,
    };
  }
}

class BeneficioPage extends StatelessWidget {
  const BeneficioPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Beneficio> beneficios = [
      Beneficio(
        nome: 'Cesta Básica',
        descricao: 'Descrição do benefício',
        endereco: 'Endereço fictício: Rua das Flores, 123, São Paulo, SP',
        data: DateTime.now(), // Exemplo de data
        horario: '10:00 AM',
        retirado: true, // Exemplo de status de retirada
      ),
      Beneficio(
        nome: 'Kit de Higiene Pessoal',
        descricao: 'Kit básico de higiene pessoal',
        endereco: 'Endereço fictício: Av. Paulista, 2000, São Paulo, SP',
        data: DateTime.now()
            .add(const Duration(days: 2)), // Exemplo de data futura
        horario: '14:00 PM',
        retirado: false, // Status de retirada para Não Retirado
      ),
      Beneficio(
        nome: 'Vale Refeição',
        descricao: 'Vale refeição para uso em restaurantes parceiros',
        endereco: 'Endereço fictício: Rua Augusta, 500, São Paulo, SP',
        data: DateTime.now()
            .add(const Duration(days: 5)), // Exemplo de data futura
        horario: '12:00 PM',
        retirado: true, // Status de retirada para Retirado
      ),
      // Adicione mais benefícios aqui conforme necessário
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Benefícios'),
      ),
      body: ListView.builder(
        itemCount: beneficios.length,
        itemBuilder: (context, index) {
          Color corDoCarimbo =
              beneficios[index].retirado ? Colors.green : Colors.red;
          String textoDoCarimbo =
              beneficios[index].retirado ? 'Retirado' : 'Não Retirado';

          return Stack(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Agendamento da Retirada:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      const Text("Nome do Benefício:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(beneficios[index].nome),
                      const SizedBox(height: 8),
                      const Text("Data:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          "${beneficios[index].data.day}/${beneficios[index].data.month}/${beneficios[index].data.year}"),
                      const SizedBox(height: 8),
                      const Text("Local:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(beneficios[index].endereco),
                      const SizedBox(height: 8),
                      const Text("Horário:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(beneficios[index].horario),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: corDoCarimbo,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Center(
                    // Garante que o texto esteja centralizado
                    child: Text(textoDoCarimbo,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
