import 'package:flutter/material.dart';
import 'package:cadastro_app/pages/Login_Page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'govAssist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(), // Página inicial
        '/loginPage': (context) => LoginPage(), // Página de login
        // Outras rotas...
      },
    );
  }
}
