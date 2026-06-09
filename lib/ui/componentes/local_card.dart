import 'package:flutter/material.dart';
import '../../modelo/local_pesca.dart';

class LocalCard extends StatelessWidget {
  final LocalPesca local;
  final VoidCallback aoClicar;

  const LocalCard({super.key, required this.local, required this.aoClicar});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Colors.blue),
        title: Text(
          local.nome,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${local.regiao}  •  ${local.temperatura}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: aoClicar,
      ),
    );
  }
}
