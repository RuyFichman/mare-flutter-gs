import '../modelo/registro.dart';

List<Registro> obterTodosRegistros() {
  return const [
    Registro(
      data: '10/05/2026',
      local: 'Ubatuba',
      especie: 'Robalo',
      quantidade: 3,
      descricao: 'Mar calmo pela manhã, boa pescaria perto dos costões.',
    ),
    Registro(
      data: '12/05/2026',
      local: 'Paraty',
      especie: 'Pargo',
      quantidade: 2,
      descricao: 'Dia nublado e vento fraco, peixes pouco ativos.',
    ),
    Registro(
      data: '15/05/2026',
      local: 'Ilhabela',
      especie: 'Sardinha',
      quantidade: 12,
      descricao: 'Cardume grande logo cedo, ótimo dia de pesca.',
    ),
  ];
}
