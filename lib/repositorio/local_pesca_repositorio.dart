import '../modelo/local_pesca.dart';

List<LocalPesca> obterTodosLocais() {
  return const [
    LocalPesca(
      nome: 'Ubatuba',
      regiao: 'SP',
      temperatura: '24°C',
      descricao:
          'Ótimo local para pesca esportiva. Águas calmas e boa visibilidade.',
    ),
    LocalPesca(
      nome: 'Ilhabela',
      regiao: 'SP',
      temperatura: '23°C',
      descricao: 'Região protegida com grande biodiversidade marinha.',
    ),
    LocalPesca(
      nome: 'Paraty',
      regiao: 'RJ',
      temperatura: '25°C',
      descricao: 'Baía calma, ideal para iniciantes.',
    ),
    LocalPesca(
      nome: 'Angra dos Reis',
      regiao: 'RJ',
      temperatura: '24°C',
      descricao: 'Várias ilhas e bons pontos de pesca.',
    ),
    LocalPesca(
      nome: 'Florianópolis',
      regiao: 'SC',
      temperatura: '21°C',
      descricao: 'Boa para pesca de tainha em determinadas épocas.',
    ),
    LocalPesca(
      nome: 'Cabo Frio',
      regiao: 'RJ',
      temperatura: '22°C',
      descricao: 'Ressurgência marinha gera alta produtividade pesqueira.',
    ),
  ];
}

List<LocalPesca> filtrarPorRegiao(String regiao) {
  return obterTodosLocais().where((local) => local.regiao == regiao).toList();
}
