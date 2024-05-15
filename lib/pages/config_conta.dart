import 'package:flutter/material.dart';

class QuestionarioPage extends StatefulWidget {
  @override
  _QuestionarioPageState createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  int? _idade;
  String? _sexo;
  String? _estadoCivil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionário IBGE'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome Completo'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o seu nome completo.';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _nome = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Sexo'),
              items: const [
                DropdownMenuItem(value: 'Masculino', child: Text('Masculino')),
                DropdownMenuItem(value: 'Feminino', child: Text('Feminino')),
                DropdownMenuItem(value: 'Outro', child: Text('Outro')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _sexo = newValue!;
                });
              },
              onSaved: (value) {
                setState(() {
                  _sexo = value as String?;
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a sua idade.';
                } else if (int.tryParse(value) == null) {
                  return 'Por favor, insira um número válido.';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _idade = int.parse(value!);
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Estado Civil'),
              items: const [
                DropdownMenuItem(
                    value: 'Solteiro(a)', child: Text('Solteiro(a)')),
                DropdownMenuItem(value: 'Casado(a)', child: Text('Casado(a)')),
                DropdownMenuItem(
                    value: 'Divorciado(a)', child: Text('Divorciado(a)')),
                DropdownMenuItem(value: 'Viúvo(a)', child: Text('Viúvo(a)')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _estadoCivil = newValue!;
                });
              },
              onSaved: (value) {
                setState(() {
                  _estadoCivil = value as String?;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dados salvos com sucesso')),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
