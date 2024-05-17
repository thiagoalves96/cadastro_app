import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: AgendarRetiradaPage()));
}

class AgendarRetiradaPage extends StatefulWidget {
  @override
  _AgendarRetiradaPageState createState() => _AgendarRetiradaPageState();
}

class _AgendarRetiradaPageState extends State<AgendarRetiradaPage> {
  final TextEditingController dataController = TextEditingController();
  final TextEditingController horaInicialController = TextEditingController();
  final TextEditingController horaFinalController = TextEditingController();
  List<String> tiposBeneficios = [
    'Cesta Básica',
    'Sacola de Legumes',
    'Sacola de Frutas'
  ];
  List<Map<String, dynamic>> usuarios = []; // Simulando uma lista de usuários
  List<DateTime> agendamentos = []; // Lista para armazenar os agendamentos
  bool mostrarUsuarios =
      false; // Controlador para mostrar ou esconder a lista de usuários

  @override
  void initState() {
    super.initState();
    // Preparando os dados de teste
    for (int i = 1; i <= 10; i++) {
      usuarios.add({
        'id': i,
        'nome': 'Usuario $i',
        'beneficio': 'Cesta Básica',
        'disponivel': true,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Retirada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: dataController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (pickedDate != null && pickedDate != DateTime.now()) {
                  setState(() {
                    dataController.text =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                  });
                }
              },
              decoration: InputDecoration(labelText: 'Data'),
            ),
            DropdownButton<String>(
              value: tiposBeneficios[0],
              icon: Icon(Icons.arrow_downward),
              onChanged: (String? newValue) {
                setState(() {
                  // Atualiza o valor selecionado
                });
              },
              items:
                  tiposBeneficios.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: horaInicialController,
                    readOnly: true, // Torna o campo somente leitura
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        int hour = pickedTime.hour;
                        int minute = pickedTime.minute;
                        String formattedHour =
                            '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
                        setState(() {
                          horaInicialController.text = formattedHour;
                        });
                      }
                    },
                    decoration: InputDecoration(labelText: 'Hora Inicial'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: horaFinalController,
                    readOnly: true, // Torna o campo somente leitura
                    onTap: () async {
                      try {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: int.tryParse(
                                    horaInicialController.text.split(':')[0]) ??
                                0,
                            minute: int.tryParse(
                                    horaInicialController.text.split(':')[1]) ??
                                0,
                          ),
                        );
                        if (pickedTime != null) {
                          int hour = pickedTime.hour;
                          int minute = pickedTime.minute;
                          String formattedHour =
                              '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
                          setState(() {
                            horaFinalController.text = formattedHour;
                          });
                        }
                      } catch (e) {
                        print("Erro ao processar a seleção de tempo: $e");
                      }
                    },
                    decoration: InputDecoration(labelText: 'Hora Final'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                String horaInicial = horaInicialController.text;
                String horaFinal = horaFinalController.text;

                // Analisa a data no formato dd/MM/yyyy e converte para yyyy-MM-dd
                String dataSelecionada = DateFormat('yyyy-MM-dd').format(
                    DateFormat('dd/MM/yyyy').parse(dataController.text));

                // Combina a data selecionada com a hora inicial e final para criar os objetos DateTime
                DateTime inicio =
                    DateTime.parse('$dataSelecionada $horaInicial:00');
                DateTime fim = DateTime.parse('$dataSelecionada $horaFinal:00');

                Duration duracao = fim.difference(inicio);

                // Limpa a lista de agendamentos antes de adicionar novos
                agendamentos.clear();

                // Calcula os agendamentos com um intervalo de 10 minutos entre cada
                for (int i = 0; i < duracao.inMinutes ~/ 10; i++) {
                  DateTime agendamento = inicio.add(Duration(minutes: i * 10));
                  agendamentos.add(agendamento);
                }

                // Atribui um agendamento específico a cada usuário
                for (int i = 0; i < usuarios.length; i++) {
                  if (i < agendamentos.length) {
                    usuarios[i]['horarioAgendado'] =
                        DateFormat('HH:mm').format(agendamentos[i]);
                  } else {
                    usuarios[i]['horarioAgendado'] = 'Sem horário disponível';
                  }
                }

                // Mostra a lista de usuários após o agendamento
                setState(() {
                  mostrarUsuarios = true;
                });

                // Remove o foco do teclado
                FocusScope.of(context).unfocus();
              },
              child: Text('Agendar'),
            ),
            SizedBox(height: 20),
            if (mostrarUsuarios)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: usuarios.length,
                  itemBuilder: (context, index) {
                    var usuario = usuarios[index];
                    return ListTile(
                      title: Text(usuario['nome']),
                      subtitle: Text(usuario['beneficio']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(usuario[
                              'horarioAgendado']), // Exibindo o horário agendado
                          IconButton(
                            icon: Icon(usuario['disponivel']
                                ? Icons.check
                                : Icons.close),
                            color: usuario['disponivel']
                                ? Colors.green
                                : Colors.red,
                            onPressed: () {
                              // Implementar ação ao clicar no ícone
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
