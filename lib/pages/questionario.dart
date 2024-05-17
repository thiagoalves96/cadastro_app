import 'package:flutter/material.dart';

class QuestionarioPage extends StatefulWidget {
  @override
  _QuestionarioPageState createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  int _currentStep = 0;
  List<String> _questions = [];
  List<String> _answers = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateQuestions(); // Garante que as perguntas sejam geradas no initState
  }

  void _generateQuestions() {
    // Define um conjunto fixo de perguntas
    _questions = [
      "Pergunta 1: Qual é sua preferência de cor?",
      "Pergunta 2: Qual é o seu animal favorito?",
      "Pergunta 3: Qual é o seu hobby principal?"
    ];
  }

  bool _isAnswerProvided(int index) {
    return _answers.length > index && _answers[index].isNotEmpty;
  }

  void _nextStep() {
    setState(() {
      if (_answers.length <= _currentStep) {
        _answers.add(
            _controller.text); // Adiciona a resposta atual à lista de respostas
      } else {
        _answers[_currentStep] =
            _controller.text; // Atualiza a resposta existente
      }
      _currentStep++;
      _controller.clear(); // Limpa o campo de entrada para a próxima pergunta
    });
  }

  void _previousStep() {
    setState(() {
      _currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionário'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ..._questions.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String question = entry.value;
                  return idx < _currentStep
                      ? ListTile(
                          leading: Text('Q${idx + 1}'),
                          title: Text(question),
                          trailing:
                              Text(_answers[idx]), // Mostra a resposta anterior
                        )
                      : Container(); // Não mostra nada para perguntas futuras
                }).toList(),
                if (_currentStep < _questions.length)
                  Text(_questions[_currentStep],
                      style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      if (_answers.length <= _currentStep) {
                        _answers.add(value);
                      } else {
                        _answers[_currentStep] = value;
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma resposta.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_currentStep > 0)
                      ElevatedButton(
                        onPressed: _previousStep,
                        child: Text('Anterior'),
                      ),
                    if (_currentStep < _questions.length - 1 &&
                        _isAnswerProvided(
                            _currentStep)) // Habilita "Próximo" apenas se houver resposta
                      ElevatedButton(
                        onPressed: _nextStep,
                        child: Text('Próximo'),
                      ),
                    if (_currentStep == _questions.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          print('Questionário finalizado!');
                          // Pode adicionar lógica adicional aqui, como salvar as respostas
                        },
                        child: Text('Finalizar'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
