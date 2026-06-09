import 'package:flutter/material.dart';
import '../../modelo/local_pesca.dart';

class DetalheScreen extends StatelessWidget {
  final LocalPesca local;

  const DetalheScreen({super.key, required this.local});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(local.nome),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          local.nome,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.map, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text('Região: ${local.regiao}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.thermostat, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text('Temperatura do mar: ${local.temperatura}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(local.descricao, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${local.nome} salvo nos favoritos!'),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite),
                label: const Text('Favoritar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
