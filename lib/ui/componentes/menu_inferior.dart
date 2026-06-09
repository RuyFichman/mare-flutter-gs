import 'package:flutter/material.dart';
import '../../navegacao/app_rotas.dart';

class MenuInferior extends StatelessWidget {
  final String atual;

  const MenuInferior({super.key, required this.atual});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemMenu(context, Icons.home, 'Início', AppRotas.inicio),
          itemMenu(context, Icons.description, 'Diário', AppRotas.diario),
          itemMenu(context, Icons.set_meal, 'Espécies', AppRotas.especies),
          itemMenu(context, Icons.map, 'Mapa', AppRotas.mapa),
        ],
      ),
    );
  }

  Widget itemMenu(
    BuildContext context,
    IconData icone,
    String texto,
    String rota,
  ) {
    final ativo = rota == atual;
    final cor = ativo ? Colors.blue : Colors.grey;

    return InkWell(
      onTap: () {
        if (!ativo) {
          Navigator.pushReplacementNamed(context, rota);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor),
          const SizedBox(height: 4),
          Text(texto, style: TextStyle(color: cor, fontSize: 12)),
        ],
      ),
    );
  }
}
