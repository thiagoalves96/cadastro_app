import 'package:flutter/material.dart';

class HomePageOSC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home OSC'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
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
                    backgroundColor: Color.fromARGB(255, 230, 227, 227),
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/65/59/05/65590513a81918f9142d3c69b6deeabf.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text('Quantidade de Usuários: 22'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.add_box),
                  title: Text('Criar questionários para os Usuários'),
                  onTap: () {
                    // Implemente a navegação ou ação aqui
                  },
                ),
                ListTile(
                  leading: Icon(Icons.file_download),
                  title: Text('Exportar questionários dos Usuários'),
                  onTap: () {
                    // Implemente a navegação ou ação aqui
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Agendar retirada dos Benefícios'),
                  onTap: () {
                    // Implemente a navegação ou ação aqui
                  },
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Enviar Mensagem para os Usuários'),
                  onTap: () {
                    // Implemente a navegação ou ação aqui
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
