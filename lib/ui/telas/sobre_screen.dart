import 'package:flutter/material.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o Maré'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Icon(Icons.waves, size: 80, color: Colors.blue)),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Maré',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'O que é o Maré?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Maré é uma plataforma brasileira de inteligência pesqueira responsável, alimentada por dados de satélite e pelo diário de bordo da própria comunidade pesqueira.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Objetivo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Conectar dados orbitais com a decisão na ponta, ajudando pescadores artesanais, esportivos e comerciais a pescar com mais segurança e responsabilidade.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'ODS Relacionados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '• ODS 14 - Vida na Água\n• ODS 9 - Indústria e Inovação\n• ODS 13 - Ação Climática',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Fontes de dados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Copernicus Marine (Sentinel-3)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Temperatura do mar e clorofila — ESA',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'Open-Meteo Marine',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Previsão de ondas, vento e condições',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'Global Fishing Watch',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Atividade de frotas industriais',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'ICMBio / IBAMA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Espécies em defeso e áreas protegidas',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
