import 'package:cadastro_app/pageOsc/page_osc.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_app/custom_text_field.dart';

class ComunicadoOscPage extends StatefulWidget {
  @override
  _ComunicadoOscPageState createState() => _ComunicadoOscPageState();
}

class _ComunicadoOscPageState extends State<ComunicadoOscPage> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController conteudoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Comunicado'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              labelText: 'Título',
              controller: tituloController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            SizedBox(height: 16),
            CustomTextField(
              labelText: 'Conteúdo',
              controller: conteudoController,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
            ),
            SizedBox(height: 16),
            Center(
              // Centralizando os botões
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centralizando horizontalmente
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String titulo = tituloController.text;
                      String conteudo = conteudoController.text;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Título: $titulo\nConteúdo: $conteudo")));
                    },
                    child: Text('Salvar'),
                  ),
                  SizedBox(width: 16), // Espaçamento entre os botões
                  ElevatedButton(
                    onPressed: () {
                      tituloController.clear();
                      conteudoController.clear();
                    },
                    child: Text('Cancelar'),
                  ),
                  SizedBox(width: 16), // Espaçamento entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageOSC()),
                      );
                    },
                    child: Text('Sair'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
