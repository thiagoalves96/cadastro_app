import 'package:flutter/material.dart';

class MensagemPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _mensagens = [
    {
      'remetente': 'Você',
      'conteudo': 'Olá, Estou com uma dúvida?',
      'status': 'entrada'
    },
    {
      'remetente': 'Nome da OSC',
      'conteudo': 'Olá Estou aqui para ajudar. Como posso ajuda-lo hoje?',
      'status': 'saida'
    },
    {
      'remetente': 'Você',
      'conteudo': 'Preciso de informações sobre o nosso próximo evento.',
      'status': 'entrada'
    },
    {
      'remetente': 'Nome da OSC',
      'conteudo':
          'O próximo evento será no dia 15 de abril. Você pode participar online ou pessoalmente, dependendo da sua preferência.',
      'status': 'saida'
    },
    // Adicione mais mensagens conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      body: Column(
        children: [
          // Cabeçalho com nome e status
          _buildHeader(),
          // Lista de mensagens
          Expanded(
            child: ListView.builder(
              itemCount: _mensagens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_mensagens[index]['remetente']),
                  subtitle: Text(_mensagens[index]['conteudo']),
                  tileColor: _mensagens[index]['status'] == 'entrada'
                      ? Colors.grey[200]
                      : Colors.white,
                );
              },
            ),
          ),
          // Campo de entrada de mensagem
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Aqui você pode adicionar a lógica para enviar a mensagem
                          print(_controller.text);
                          _controller.clear(); // Limpa o campo após enviar
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue, // Altere para o azul claro desejado
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Nome da OSC',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'Status: Online',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
