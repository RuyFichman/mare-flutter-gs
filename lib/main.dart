import 'package:flutter/material.dart';
import 'navegacao/app_rotas.dart';
import 'navegacao/app_navegacao.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maré',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      initialRoute: AppRotas.splash,
      onGenerateRoute: AppNavegacao.gerarRota,
    );
  }
}
