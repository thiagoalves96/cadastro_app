import 'package:cadastro_app/pages/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_app/custom_text_field.dart'; // Importe o GradientContainer

class RecuperarContaPage extends StatefulWidget {
  @override
  _RecuperarContaPageState createState() => _RecuperarContaPageState();
}

class _RecuperarContaPageState extends State<RecuperarContaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        // Uso do GradientContainer
        child: Padding(
          padding: const EdgeInsets.only(
              top: 100.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0), // Adiciona espaço no topo
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Por favor, insira o email associado à sua conta para receber um código de recuperação.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Simular o envio do código de recuperação
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Código enviado para o seu email.')),
                      );
                    }
                  },
                  child: const Text('Enviar Código'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ); // Voltar para a página de login
                  },
                  child: const Text('Voltar para Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
