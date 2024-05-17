import 'package:flutter/material.dart';

class CreateQuestionsPage extends StatefulWidget {
  @override
  _CreateQuestionsPageState createState() => _CreateQuestionsPageState();
}

class _CreateQuestionsPageState extends State<CreateQuestionsPage> {
  List<String> _questions = [];
  TextEditingController _questionController = TextEditingController();

  void _addQuestion() {
    setState(() {
      _questions.add(_questionController.text.trim());
      _questionController
          .clear(); // Limpa o campo de texto após adicionar a pergunta
    });
  }

  void _sendQuestionsAndGoBack(BuildContext context) async {
    // Verifica se a lista de perguntas está vazia
    if (_questions.isEmpty) {
      // Mostra uma mensagem de erro se a lista estiver vazia
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, adicione pelo menos uma pergunta.'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red, // Cor de fundo para mensagens de erro
        ),
      );
      return; // Retorna da função sem enviar perguntas
    }

    // Simula o envio das perguntas
    await Future.delayed(const Duration(seconds: 1)); // Simulação de delay
    Navigator.pop(context); // Volta para a tela anterior
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Questionários enviados com sucesso!!'),
        duration: Duration(seconds: 3), // Mostra a mensagem por 3 segundos
        backgroundColor: Colors.green, // Cor de fundo para mensagens de sucesso
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_questions[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Digite a Pergunta',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addQuestion,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Volta para a tela anterior
                },
                child: const Text('Voltar Tela Inicial'),
              ),
              ElevatedButton(
                onPressed: () => _sendQuestionsAndGoBack(context),
                child: const Text('Enviar Perguntas'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
