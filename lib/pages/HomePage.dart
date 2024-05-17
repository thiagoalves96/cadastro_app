import 'package:cadastro_app/pages/Login_Page.dart';
import 'package:cadastro_app/pages/config_conta.dart';
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
        title: const Text('NOME DA OSC'),
        backgroundColor: Colors.blue,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
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
              leading: const Icon(Icons.question_answer),
              title: const Text('Questionário'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionarioPage()),
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
            // Dentro do arquivo HomePage.dart, dentro do método build do Drawer
            ListTile(
              leading: const Icon(Icons.settings), // Ícone de configuração
              title: const Text('Configurações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigPage()),
                );
              },
            ),
            Expanded(
              child: Container(),
            ),

            // Adicionando o ListTile de Sair
            ListTile(
              leading: const Icon(Icons.logout), // Ícone de sair
              title: const Text('Sair'),
              onTap: () {
                // Navega de volta à página de login
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      // Dentro do método build do corpo da HomePage
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Notícias e Atualizações',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              // Artigo fictício sobre um novo recurso
              Card(
                child: ListTile(
                  leading: const Icon(Icons.new_releases),
                  title: const Text(
                      'Novo recurso lançado: Análise de Dados Avançada'),
                  subtitle: const Text(
                      'Descubra como otimizar seus processos com nossa nova ferramenta de análise de dados avançada.'),
                  trailing: const Text('Ler mais'),
                  onTap: () {
                    // Navegar para detalhes da notícia
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => DetalhesArtigoPage()),
                    // );
                  },
                ),
              ),
              // Promoção
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.local_offer),
                    title: const Text('Promoção Especial'),
                    subtitle: const Text(
                        'Desfrute de 20% de desconto em todos os planos premium até o final do mês.'),
                    trailing: const Text('Ver oferta'),
                    onTap: () {
                      // Navegar para detalhes da promoção
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => DetalhesPromocaoPage()),
                      // );
                    },
                  ),
                ),
              ),
              // Conteúdo educativo
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text(
                        'Dica do Dia: Organize suas tarefas eficientemente'),
                    subtitle: const Text(
                        'Aprenda técnicas para melhorar sua produtividade e equilíbrio pessoal.'),
                    trailing: const Text('Saiba mais'),
                    onTap: () {
                      // Navegar para detalhes da dica
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => DetalhesDicaPage()),
                      // );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre as notícias
              // Outros conteúdos como destaque de funcionalidades, promoções, etc.
            ],
          );
        },
      ),
    );
  }
}

InformacoesPage() {}
