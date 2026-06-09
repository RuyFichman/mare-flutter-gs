import 'package:flutter/material.dart';
import '../../navegacao/app_rotas.dart';
import '../componentes/menu_inferior.dart';

class EspeciesScreen extends StatelessWidget {
  const EspeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Especie> listaEspecies = const [
      Especie(
        nome: 'Robalo',
        defeso: false,
        descricao: 'Pesca permitida o ano todo, respeitando o tamanho mínimo.',
      ),
      Especie(
        nome: 'Pargo',
        defeso: false,
        descricao: 'Captura liberada na região costeira de SP e RJ.',
      ),
      Especie(
        nome: 'Tainha',
        defeso: true,
        descricao: 'Em defeso de maio a julho, durante o período de reprodução.',
      ),
      Especie(
        nome: 'Sardinha',
        defeso: true,
        descricao: 'Defeso de novembro a fevereiro para proteger a desova.',
      ),
      Especie(
        nome: 'Camarão-rosa',
        defeso: true,
        descricao: 'Captura proibida até o fim do período de defeso no litoral.',
      ),
      Especie(
        nome: 'Dourado',
        defeso: false,
        descricao: 'Pesca esportiva liberada em alto-mar.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Espécies'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Sobre',
            onPressed: () {
              Navigator.pushNamed(context, AppRotas.sobre);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: listaEspecies.length,
          itemBuilder: (context, index) {
            return EspecieCard(especie: listaEspecies[index]);
          },
        ),
      ),
      bottomNavigationBar: const MenuInferior(atual: AppRotas.especies),
    );
  }
}

class Especie {
  final String nome;
  final bool defeso;
  final String descricao;

  const Especie({
    required this.nome,
    required this.defeso,
    required this.descricao,
  });
}

class EspecieCard extends StatelessWidget {
  final Especie especie;

  const EspecieCard({super.key, required this.especie});

  @override
  Widget build(BuildContext context) {
    final cor = especie.defeso ? Colors.red : Colors.green;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              especie.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: cor,
              ),
            ),
            const SizedBox(height: 4),
            Text(especie.descricao),
          ],
        ),
      ),
    );
  }
}
