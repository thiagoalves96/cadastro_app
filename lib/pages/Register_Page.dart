import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cadastro_app/custom_text_field.dart'; // Ajuste o caminho conforme necessário
import 'package:cadastro_app/pages/HomePage.dart'; // Adicione esta linha para importar a HomePage

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = ''; // Este campo é para o nome do usuário
  String _email = '';
  String _password = '';
  String _idAssociacao = ''; // Este campo é para o ID da Associação

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900, // Começa com azul escuro
              Colors.blue.shade700, // Transição para azul claro
              Colors.white, // Termina com branco
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    labelText: 'Nome',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu nome';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!,
                  ),
                  CustomTextField(
                    labelText: 'ID da Associação',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o ID da Associação';
                      }
                      return null;
                    },
                    onSaved: (value) => _idAssociacao = value!,
                  ),
                  CustomTextField(
                    labelText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                  CustomTextField(
                    labelText: 'Senha',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Aqui você pode adicionar a lógica para salvar os dados do usuário
                        print(
                            'Nome: $_name, Email: $_email, Senha: $_password, ID da Associação: $_idAssociacao');
                      }
                    },
                    child: Text('Cadastrar'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Isso volta para a página anterior na pilha de navegação
                    },
                    child: Text('Voltar para o Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
