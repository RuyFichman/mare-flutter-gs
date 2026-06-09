import 'package:flutter/material.dart';
import '../../navegacao/app_rotas.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int paginaAtual = 0;

  final List<Map<String, dynamic>> paginas = const [
    {
      'icone': Icons.satellite_alt,
      'titulo': 'Dados de Satélite',
      'descricao':
          'O Maré usa dados de satélite gratuitos para entregar previsão do mar, mapas de áreas protegidas e melhores zonas de pesca.',
    },
    {
      'icone': Icons.book,
      'titulo': 'Diário de Bordo',
      'descricao':
          'Registre suas saídas e construa seu histórico de pesca. Seus dados ajudam a comunidade pesqueira a entender o mar.',
    },
    {
      'icone': Icons.eco,
      'titulo': 'Pesca Responsável',
      'descricao':
          'Saiba quais espécies estão em defeso e em que áreas a pesca é permitida. Pesque com consciência.',
    },
  ];

  void proximaPagina() {
    if (paginaAtual < paginas.length - 1) {
      setState(() {
        paginaAtual++;
      });
    } else {
      Navigator.pushReplacementNamed(context, AppRotas.inicio);
    }
  }

  void paginaAnterior() {
    if (paginaAtual > 0) {
      setState(() {
        paginaAtual--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pagina = paginas[paginaAtual];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      pagina['icone'] as IconData,
                      size: 120,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      pagina['titulo'] as String,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      pagina['descricao'] as String,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: paginaAtual > 0 ? paginaAnterior : null,
                    child: const Text('Voltar'),
                  ),
                  Text('${paginaAtual + 1} / ${paginas.length}'),
                  ElevatedButton(
                    onPressed: proximaPagina,
                    child: Text(
                      paginaAtual == paginas.length - 1 ? 'Começar' : 'Próximo',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
