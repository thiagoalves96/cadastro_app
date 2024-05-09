import 'package:cadastro_app/lib/pages/Login_Page.dart';
import 'package:cadastro_app/lib/pages/beneficio_page.dart';
import 'package:cadastro_app/lib/pages/historico_page.dart';
import 'package:cadastro_app/lib/pages/mensagem_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isActive = false;
  final List<String> _questions = [
    'Qual é o seu nome?',
    'Como você está se sentindo hoje?',
    'O que você gostaria de fazer hoje?',
    'Qual é o seu hobby favorito?',
    'O que você mais gosta de comer?',
    // Adicione mais perguntas conforme necessário
  ];
  late List<String> _responses;

  @override
  void initState() {
    super.initState();
    _responses = List.generate(_questions.length, (index) => '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOME DA OSC'),
        backgroundColor:
            Colors.blue, // Define a cor de fundo do AppBar para azul
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20, // Ajuste o tamanho conforme necessário
              backgroundColor: Colors.grey[850], // Cor de fundo cinza escuro
              // backgroundImage: NetworkImage('URL_DA_IMAGEM')
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Nome do Usuário', // Substitua 'Nome do Usuário' pelo nome real do usuário
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'CPF: 12312345555',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isActive =
                                !_isActive; // Alterna o estado de ativação
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _isActive
                                  ? 'Status: Ativo '
                                  : 'Status: Inativo ', // Mostra o status atual
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                                width:
                                    5), // Espaçamento entre o texto e o ícone
                            Icon(
                              _isActive
                                  ? Icons.person
                                  : Icons
                                      .person_off, // Alterna o ícone de status
                              size:
                                  16, // Ícone de status, você pode escolher outro ícone conforme necessário
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Histórico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricoPage()),
                );
              },
            ),
            // Dentro do Drawer na HomePage
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Mensagem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MensagemPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text('Benefício'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BeneficioPage()),
                );
              },
            ),

            // Espaço ocupado pelo Expanded para empurrar o ListTile de Sair para o final
            Expanded(
              child:
                  Container(), // Um Container vazio para ocupar o espaço necessário
            ),

            // Adicionando o ListTile de Sair
            ListTile(
              leading: Icon(Icons.logout), // Ícone de sair
              title: Text('Sair'),
              onTap: () {
                // Navega de volta à página de login
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Aqui começa a lista de questionários
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(_questions[index]),
                      onTap: () {
                        // Lógica para lidar com o toque na pergunta
                        print('Pergunta tocada: ${_questions[index]}');
                      },
                    ),
                    Container(
                      // Adiciona um Container para controlar a largura
                      width:
                          double.infinity, // Preenche toda a largura disponível
                      child: TextField(
                        controller:
                            TextEditingController(text: _responses[index]),
                        onChanged: (value) {
                          setState(() {
                            _responses[index] = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Resposta',
                          hintText: 'Digite sua resposta aqui',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Arredonda os cantos
                          ),
                          filled: true,
                          fillColor: Colors.grey[200], // Cor de fundo do input
                          labelStyle: TextStyle(
                            color: Colors.grey[700], // Cor do texto do label
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[500], // Cor do texto do hint
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _responses[index] = '';
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para enviar a resposta
                        print('Resposta enviada: ${_responses[index]}');
                      },
                      child: Text('Enviar'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Arredonda os cantos do botão
                        ),
                        backgroundColor: Colors.blue, // Cor de fundo do botão
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
