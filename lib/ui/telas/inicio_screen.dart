import 'package:flutter/material.dart';
import '../../navegacao/app_rotas.dart';
import '../componentes/menu_inferior.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.waves),
            SizedBox(width: 8),
            Text('Maré'),
          ],
        ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Minha Localização - Ubatuba, SP',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  DadoMar(valor: '1.2m', rotulo: 'Ondas'),
                  DadoMar(valor: '12km/h', rotulo: 'Vento NE'),
                  DadoMar(valor: '24°C', rotulo: 'Água'),
                  DadoMar(valor: '28°C', rotulo: 'Ar'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.green.shade100,
              child: Text(
                'Condições favoráveis para saída',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Previsão 24h',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const LinhaPrevisao(
              hora: '06:00',
              condicao: '22°C - Vento 8km/h - Mar calmo',
            ),
            const LinhaPrevisao(
              hora: '10:00',
              condicao: '26°C - Vento 12km/h - Mar calmo',
            ),
            const LinhaPrevisao(
              hora: '14:00',
              condicao: '27°C - Vento 15km/h - Mar moderado',
            ),
            const LinhaPrevisao(
              hora: '18:00',
              condicao: '23°C - Vento 18km/h - Mar moderado',
            ),
            const SizedBox(height: 16),
            const Text('Alertas ativos', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const AlertaCard(
              titulo: 'Defeso — Camarão-rosa',
              detalhe: 'Até 31/05/2026  •  Litoral SP',
            ),
            const AlertaCard(
              titulo: 'Defeso — Caranguejo-uçá',
              detalhe: 'Até 30/06/2026  •  Litoral SP',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuInferior(atual: AppRotas.inicio),
    );
  }
}

class DadoMar extends StatelessWidget {
  final String valor;
  final String rotulo;

  const DadoMar({super.key, required this.valor, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valor,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(rotulo, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class LinhaPrevisao extends StatelessWidget {
  final String hora;
  final String condicao;

  const LinhaPrevisao({super.key, required this.hora, required this.condicao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            hora,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(condicao, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}

class AlertaCard extends StatelessWidget {
  final String titulo;
  final String detalhe;

  const AlertaCard({super.key, required this.titulo, required this.detalhe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(detalhe, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Ativo',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
