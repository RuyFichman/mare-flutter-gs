Maré

  O Maré é um aplicativo feito em Flutter que junta informações úteis pra quem pesca: previsão do mar, alertas de defeso, dados sobre as
  espécies e um diário de bordo pra registrar as pescarias. A ideia é aproximar os dados de satélite da decisão do dia a dia, ajudando
  pescadores artesanais, esportivos e comerciais a pescar com mais segurança e consciência ambiental.

   Projeto desenvolvido para a Global Solution da FIAP.

Problema e propósito

  A pesca no litoral brasileiro esbarra em dois problemas: a falta de informação confiável sobre as condições do mar e o desconhecimento
  das regras de defeso (os períodos em que a captura de certas espécies é proibida pra proteger a reprodução). O Maré tenta resolver isso
  reunindo esses dados em uma tela só, de um jeito simples, pra incentivar uma pesca mais segura e sustentável.

  ODS relacionados

  - ODS 14, Vida na Água
  - ODS 9, Indústria, Inovação e Infraestrutura
  - ODS 13, Ação Climática

  Fontes de dados (referência)

  O app é um protótipo com dados de demonstração, mas se inspira em fontes reais:
  - Copernicus Marine (Sentinel-3 / ESA), pra temperatura do mar e clorofila
  - Open-Meteo Marine, pra previsão de ondas, vento e condições
  - Global Fishing Watch, pra atividade de frotas industriais
  - ICMBio / IBAMA, pra espécies em defeso e áreas protegidas


  Telas e funcionalidades

  - Splash: Tela de abertura com o logo do app. Depois de 3 segundos ela avança sozinha pra introdução.  

  - Introdução: Tela principal, com a localização atual, as condições do mar (ondas, vento, temperatura da água e do ar), status de saída, previsão de 24h e os alertas ativos de defeso.

   - Diário de Bordo:  Lista dos registros de pesca (data, local, espécie, quantidade e descrição), com um botão pra adicionar novos registros.

   - Espécies: Catálogo de espécies mostrando quais estão em defeso (vermelho) ou com a pesca liberada (verde), junto da descrição de regras.

   - Mapa: Mapa da região com o endereço, filtros por região e a lista de locais de pesca.

   - Detalhe do local: Informações de um local de pesca (região, temperatura do mar e descrição) e a opção de favoritar.

   - Sobre: Explica o que é o Maré, qual o objetivo, os ODS e as fontes de dados. 



 Fluxo de telas

  Splash (3s)
     │
     ▼
  Introdução (3 páginas de onboarding)
     │  "Começar"
     ▼
  Início ───────────────► Sobre (ícone ℹ️ na AppBar)
     │
     │  (menu inferior)
     ├──► Diário de Bordo
     ├──► Espécies
     └──► Mapa ──► Detalhe do Local

  - A navegação entre Início, Diário, Espécies e Mapa é feita pelo menu inferior, que aparece nessas quatro telas.
  - O ícone de informação (ℹ️) na barra de cima leva pra tela Sobre.
  - Quando você toca em um local na tela de Mapa, abre a tela de Detalhe, que recebe esse local como argumento da rota.

Arquitetura

  A organização do projeto é bem simples, separando os dados, os modelos, a navegação e a interface:

  lib/
  ├── main.dart                  # Ponto de entrada, MaterialApp e tema
  ├── modelo/                    # Modelos de dados (imutáveis)
  │   ├── local_pesca.dart
  │   └── registro.dart
  ├── repositorio/               # Fontes de dados (mockados)
  │   ├── local_pesca_repositorio.dart
  │   └── registro_repositorio.dart
  ├── navegacao/
  │   ├── app_rotas.dart         # Constantes de rotas
  │   └── app_navegacao.dart     # Geração das rotas (onGenerateRoute)
  └── ui/
      ├── componentes/           # Widgets reutilizáveis (cards, menu, logo)
      │   ├── logo_app.dart
      │   ├── local_card.dart
      │   ├── registro_card.dart
      │   └── menu_inferior.dart
      └── telas/                 # Uma tela por arquivo
          ├── splash_screen.dart
          ├── intro_screen.dart
          ├── inicio_screen.dart
          ├── diario_screen.dart
          ├── especies_screen.dart
          ├── mapa_screen.dart
          ├── detalhe_screen.dart
          └── sobre_screen.dart


Decisões de projeto

  - Navegação por rotas nomeadas: a AppRotas guarda as strings e a AppNavegacao.gerarRota resolve cada rota num switch.
  - Modelos imutáveis: classes com campos final e construtor const.
  - Repositórios como funções: eles retornam listas fixas (const) de dados de demonstração, sem banco de dados nem chamada de rede.
  - Estado local e simples: as telas com interação usam StatefulWidget com setState, e as telas estáticas usam StatelessWidget.
  - Sem dependências externas além do Flutter SDK e do cupertino_icons.

Tecnologias

  - Flutter (Material 3), com Dart ^3.11.5
  - Tema com useMaterial3 e colorSchemeSeed: Colors.blue


Como executar

  Antes de começar, é preciso ter o Flutter SDK (https://docs.flutter.dev/get-started/install) instalado.

  # 1. Instalar as dependências
  flutter pub get

  # 2. Rodar o app (com um emulador ou um celular conectado)
  flutter run

  Outros comandos que ajudam:

  flutter analyze     # Verifica problemas no código
  flutter test        # Roda os testes
  flutter build apk   # Gera o APK de release (Android)

Dados de demonstração

  Todos os dados (locais de pesca, registros, espécies, previsão e alertas) ficam fixos no código, então o app funciona como um protótipo.
  Ações como favoritar e adicionar registro funcionam só na memória enquanto o app está aberto, sem salvar nada de forma permanente.