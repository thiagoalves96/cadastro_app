import 'package:cadastro_app/pageOsc/agendar_retirada.dart';
import 'package:cadastro_app/pageOsc/comunicado_osc.dart';
import 'package:cadastro_app/pageOsc/create_quest.dart';
import 'package:flutter/material.dart';

class HomePageOSC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home OSC'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print('Sair da conta');
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/65/59/05/65590513a81918f9142d3c69b6deeabf.jpg'),
                  ),
                  Text('Quantidade de Usuários: 10'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.add_box),
                  title: const Text('Criar questionários gerais'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateQuestionsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.file_download),
                  title: const Text('Exportar questionários dos Usuários'),
                  onTap: () {
                    // Inicia a simulação do download do arquivo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Download iniciado...'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Cancelar',
                          onPressed: () {
                            // Aqui você poderia cancelar o download real, se houvesse um
                          },
                        ),
                      ),
                    );

                    // Simula o término do download após um breve período
                    Future.delayed(const Duration(seconds: 3)).then((_) {
                      ScaffoldMessenger.of(context)
                          .hideCurrentSnackBar(); // Esconde a snackbar atual
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Download concluído'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Agendar retirada dos Benefícios'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgendarRetiradaPage()),
                    );
                    // Implemente a navegação ou ação aqui
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_active_sharp),
                  title: const Text('Enviar comunicado para os Usuários'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComunicadoOscPage()),
                    ); // Implemente a navegação ou ação aqui
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
