import 'package:flutter/material.dart';
import '../../modelo/registro.dart';
import '../../repositorio/registro_repositorio.dart';
import '../../navegacao/app_rotas.dart';
import '../componentes/registro_card.dart';
import '../componentes/menu_inferior.dart';

class DiarioScreen extends StatefulWidget {
  const DiarioScreen({super.key});

  @override
  State<DiarioScreen> createState() => _DiarioScreenState();
}

class _DiarioScreenState extends State<DiarioScreen> {
  late List<Registro> listaRegistros;

  @override
  void initState() {
    super.initState();
    listaRegistros = List.from(obterTodosRegistros());
  }

  void adicionarRegistro() {
    setState(() {
      listaRegistros.add(
        const Registro(
          data: '04/06/2026',
          local: 'Cabo Frio',
          especie: 'Tainha',
          quantidade: 5,
          descricao: 'Tarde ensolarada com mar agitado, boa captura.',
        ),
      );
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Registro adicionado!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diário de Bordo'),
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
        child: listaRegistros.isEmpty
            ? const Center(child: Text('Nenhum registro ainda'))
            : ListView.builder(
                itemCount: listaRegistros.length,
                itemBuilder: (context, index) {
                  return RegistroCard(registro: listaRegistros[index]);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarRegistro,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: const MenuInferior(atual: AppRotas.diario),
    );
  }
}
