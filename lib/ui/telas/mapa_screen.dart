import 'package:flutter/material.dart';
import '../../modelo/local_pesca.dart';
import '../../repositorio/local_pesca_repositorio.dart';
import '../../navegacao/app_rotas.dart';
import '../componentes/local_card.dart';
import '../componentes/menu_inferior.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  late List<LocalPesca> listaLocais;
  String filtroAtual = 'Favoritos';

  final List<String> regioes = const ['Favoritos', 'SP', 'RJ', 'SC'];

  @override
  void initState() {
    super.initState();
    listaLocais = obterTodosLocais();
  }

  void aplicarFiltro(String regiao) {
    setState(() {
      filtroAtual = regiao;
      if (regiao == 'Favoritos') {
        listaLocais = obterTodosLocais();
      } else {
        listaLocais = filtrarPorRegiao(regiao);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
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
        child: Column(
          children: [
            Image.asset('images/map.PNG'),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Meu endereço: Avenida Brasil, 369'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Locais de Pesca',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: regioes.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final regiao = regioes[index];
                  final ativo = regiao == filtroAtual;
                  return FilterChip(
                    label: Text(regiao),
                    selected: ativo,
                    onSelected: (_) => aplicarFiltro(regiao),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: listaLocais.isEmpty
                  ? const Center(child: Text('Nenhum local encontrado'))
                  : ListView.builder(
                      itemCount: listaLocais.length,
                      itemBuilder: (context, index) {
                        final local = listaLocais[index];
                        return LocalCard(
                          local: local,
                          aoClicar: () {
                            Navigator.pushNamed(
                              context,
                              AppRotas.detalhe,
                              arguments: local,
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuInferior(atual: AppRotas.mapa),
    );
  }
}
