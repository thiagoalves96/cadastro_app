import 'package:cadastro_app/pages/Login_Page.dart';
import 'package:cadastro_app/pages/beneficio_page.dart';
import 'package:cadastro_app/pages/historico_page.dart';
import 'package:cadastro_app/pages/mensagem_page.dart';
import 'package:cadastro_app/pages/questionario.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOME DA OSC'),
        backgroundColor: Colors.blue,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 230, 227, 227),
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/65/59/05/65590513a81918f9142d3c69b6deeabf.jpg'),
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
                    'Nome do Usuário',
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
                            _isActive = !_isActive;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _isActive ? 'Status: Ativo ' : 'Status: Inativo ',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              _isActive ? Icons.person : Icons.person_off,
                              size: 16,
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
            Expanded(
              child: Container(),
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: viewportConstraints.maxWidth *
                      0.5, // Metade da largura da tela
                  height: 100, // Altura fixa
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica quando o primeiro botão for pressionado
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionarioPage()),
                      );
                    },
                    child: Text('Questionário do OSC'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // Cor do texto
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10)), // Bordas arredondadas
                    ),
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os botões
                Container(
                  width: viewportConstraints.maxWidth *
                      0.5, // Metade da largura da tela
                  height: 100, // Altura fixa
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica quando o segundo botão for pressionado
                      print('Segundo botão pressionado');
                    },
                    child: Text('Informações'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Cor do texto
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10)), // Bordas arredondadas
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

InformacoesPage() {}
