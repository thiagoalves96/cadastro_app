import 'package:flutter/material.dart';

class QuestionarioPage extends StatefulWidget {
  @override
  _QuestionarioPageState createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  int? _numeroPessoasResidencia;
  int? _maiores60;
  double? _rendaFamiliar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionário'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Qual é o seu nome?'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o seu nome.';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _nome = value;
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Quantas pessoas vivem na sua residência?'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de pessoas.';
                } else if (int.tryParse(value) == null) {
                  return 'Por favor, insira um número válido.';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _numeroPessoasResidencia = int.parse(value!);
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Quantas dessas pessoas têm mais de 60 anos?'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de pessoas.';
                } else if (int.tryParse(value) == null) {
                  return 'Por favor, insira um número válido.';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _maiores60 = int.parse(value!);
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Qual é a renda familiar mensal?'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a renda familiar.';
                } else if (double.tryParse(value) == null) {
                  return 'Por favor, insira um número válido.';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _rendaFamiliar = double.parse(value!);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Dados salvos com sucesso')),
                  );
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
