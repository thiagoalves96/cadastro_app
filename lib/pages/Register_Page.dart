import 'package:cadastro_app/pages/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_app/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  String? _idAssociacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text(
                      'Cadastro',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Nome',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu nome';
                        }
                        return null;
                      },
                      onSaved: (value) => setState(() => _name = value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        return null;
                      },
                      onSaved: (value) => setState(() => _email = value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Senha',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        return null;
                      },
                      onSaved: (value) => setState(() => _password = value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'ID da Associação',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o ID da associação';
                        }
                        return null;
                      },
                      onSaved: (value) => setState(() => _idAssociacao = value),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Aqui você pode adicionar a lógica para salvar os dados do usuário
                          print(
                              'Nome: $_name, Email: $_email, Senha: $_password, ID da Associação: $_idAssociacao');
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Voltar para o Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
