import 'package:flutter/material.dart';
import '../../modelo/registro.dart';

class RegistroCard extends StatelessWidget {
  final Registro registro;

  const RegistroCard({super.key, required this.registro});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.set_meal, color: Colors.blue, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    registro.especie,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('${registro.local}  •  ${registro.data}'),
                  Text('Quantidade: ${registro.quantidade}'),
                  const SizedBox(height: 4),
                  Text(
                    registro.descricao,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
