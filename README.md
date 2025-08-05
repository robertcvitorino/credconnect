Projeto CredConnect 
Introdução

Funcionalidades Implementadas
O aplicativo contempla a jornada de usuário principal, com a implementação das seguintes funcionalidades:

[x] Tela de Abertura (Splash Screen)

[x] Tela de Boas-vindas com opções para login e cadastro

[x] Tela de Cadastro de Usuário com validação de campos e confirmação de senha

[x] Tela de Login de Usuário com validação de campos

[x] Dashboard Principal com saudação personalizada e exibição do pool de crédito disponível

[x] Menu de Navegação Inferior para acesso às principais seções

[x] Fluxo de Solicitação de Empréstimo, incluindo:

[x] Tela de Simulação de Valor

[x] Tela de Cadastro de Novo Cliente

[x] Tela de Solicitação de Empréstimo com seleção de cliente e definição de parâmetros

[x] Tela de Confirmação para feedback de sucesso da operação

Arquitetura e Decisões Técnicas
O projeto foi estruturado sobre os princípios da Arquitetura Limpa (Clean Architecture), visando a criação de um sistema desacoplado, testável e de fácil manutenção. A organização do código é dividida em três camadas principais: Apresentação, Domínio e Dados.

Estrutura de Diretórios
A estrutura de pastas adota a abordagem Feature-First, na qual cada funcionalidade de negócio é encapsulada em seu próprio módulo, facilitando a escalabilidade e o desenvolvimento paralelo.

lib/
├── core/                   # Código compartilhado (Injeção de Dependência, Rotas, Tema, Tratamento de Erros)
├── data/                   # Camada de Dados (Implementação de Repositórios e Fontes de Dados)
├── domain/                 # Camada de Domínio (Entidades, Contratos de Repositórios, Casos de Uso)
└── presentation/           # Camada de Apresentação (Telas, Cubits/BLoCs, Widgets)

Tecnologias e Pacotes Utilizados
As seguintes tecnologias foram selecionadas para compor a stack técnica do projeto:

Gerenciamento de Estado: flutter_bloc (com a implementação Cubit) foi utilizado para gerenciar o estado da interface do usuário, promovendo uma clara separação entre a lógica de negócio e a UI.

Injeção de Dependência: get_it em conjunto com injectable para automatizar o registro e a resolução de dependências, garantindo baixo acoplamento entre as camadas.

Roteamento: go_router para gerenciar a navegação de forma declarativa e centralizada, o que simplifica o controle do fluxo de telas.

Persistência de Dados (Mock): sqflite foi empregado para simular uma fonte de dados local. Tal escolha demonstra proficiência com bancos de dados relacionais no ambiente mobile e permite a persistência de dados entre sessões.

Modelos Imutáveis: freezed para a geração de modelos de dados e classes de estado imutáveis, aumentando a segurança e reduzindo código boilerplate.

Validação de Formulários: validatorless para a criação de regras de validação de forma declarativa e concisa.

Instruções de Configuração e Execução
Para configurar e executar o projeto em um ambiente de desenvolvimento local, siga os procedimentos abaixo.

Pré-requisitos
Framework Flutter (versão 3.x ou superior)

Emulador Android ou dispositivo físico (Android 9+ recomendado)

Procedimento de Instalação
Clonar o repositório:

git clone https://github.com/seu-usuario/credconnect-app.git
cd credconnect-app

Instalar as dependências do projeto:

flutter pub get

Gerar os arquivos de código:
O projeto utiliza geradores de código para Injeção de Dependência e modelos de dados. Execute o seguinte comando para gerar os artefatos necessários:

dart run build_runner build --delete-conflicting-outputs

Executar o aplicativo:

flutter run

Geração do Pacote de Instalação (APK)
Para compilar o arquivo APK em modo de release, execute o comando abaixo na raiz do diretório do projeto:

flutter build apk --release

O pacote de instalação (app-release.apk) será gerado no seguinte diretório:
build/app/outputs/flutter-apk/app-release.apk
