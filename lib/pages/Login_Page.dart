import 'package:cadastro_app/pages/page_osc.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_app/pages/Register_Page.dart';
import 'package:cadastro_app/custom_text_field.dart';
import 'package:cadastro_app/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/app_logo.png',
                  height: 230,
                  fit: BoxFit.cover,
                ), // Adicionando o logotipo
                const SizedBox(height: 20),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                  onSaved: (value) => {_email = value!},
                  labelText: 'Email',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                  onSaved: (value) => {_password = value!},
                  labelText: 'Senha',
                ),
                const SizedBox(height: 20), // Espaçamento após o campo de senha
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      login(_email, _password);
                    }
                  },
                  child: const Text('Entrar'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text('Cadastrar'),
                ),
                const SizedBox(height: 10), // Espaçamento antes da mensagem
                const Text(
                  'Login e senha de usuario "123" e do OSC "admin"',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String email, String password) {
    if (email == '123' && password == '123') {
      print('Login bem-sucedido');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (email == 'admin' && password == 'admin') {
      print('Login OSC bem-sucedido');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageOSC()),
      );
    } else {
      print('Email ou senha incorretos');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ou senha incorretos')),
      );
    }
  }
}

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}
