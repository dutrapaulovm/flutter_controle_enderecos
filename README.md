# Sistema de Controle de Endereços

Este repositório contém o código-fonte do projeto de Sistema de Controle de Endereços, desenvolvido com Flutter. O projeto foi estruturado em iterações ao longo do tempo, com o objetivo de entregar funcionalidades de forma incremental, utilizando boas práticas de desenvolvimento.

## 🔄 Release 1

### ✅ Iteração 1: Configuração Inicial e Estrutura do Projeto
📅 **Data:** 01/03/2024 a 15/03/2024  
🎯 **Objetivo:** Preparar o ambiente de desenvolvimento e estabelecer a estrutura base do sistema.

#### Atividades:
1. Configuração da IDE, do Git e dos ambientes de desenvolvimento/teste.
2. Criação da estrutura do projeto com definição das camadas (modelo, controle, visualização).
3. Modelagem das entidades e tabelas do banco de dados.
4. Protótipo inicial das telas de cadastro e listagem.
5. Desenvolvimento de objetos mocks para testes unitários.

---

### 🔐 Iteração 2: Cadastro e Autenticação de Usuários
📅 **Data:** 16/03/2024 a 30/03/2024  
🎯 **Objetivo:** Permitir o acesso seguro ao sistema por meio de autenticação de usuários.

#### Atividades:
1. Criação da tela de login com validação de credenciais.
2. Criptografia das senhas armazenadas.
3. Implementação do controle de sessão para manter usuários autenticados.
4. Estruturação inicial para controle de permissões por tipo de usuário.

---

### 📋 Iteração 3: Funcionalidades de Cadastro e Listagem
📅 **Data:** 31/03/2024 a 14/04/2024  
🎯 **Objetivo:** Permitir o cadastro e a visualização de endereços e clientes.

#### Atividades:
1. Implementação do formulário de cadastro de endereços.
2. Implementação do formulário de cadastro de clientes.
3. Estrutura interna para armazenamento (lista).
4. Funcionalidade para listagem de endereços em tabela.
5. Validação dos campos obrigatórios.

---

### ✏️ Iteração 4: Edição e Exclusão de Endereços
📅 **Data:** 15/04/2024 a 30/04/2024  
🎯 **Objetivo:** Adicionar suporte à edição e remoção de endereços cadastrados.

#### Atividades:
1. Funcionalidade de edição de dados com carregamento do endereço selecionado.
2. Exclusão com confirmação do usuário.
3. Feedback visual (mensagens de sucesso e erro).
4. Melhorias na interface e experiência do usuário.

---

### 🚀 Iteração 5: Testes Finais e Preparação para Lançamento
📅 **Data:** 01/05/2024 a 15/05/2024  
🎯 **Objetivo:** Garantir a qualidade do sistema e finalizar para entrega.

#### Atividades:
1. Execução de testes de integração e aceitação.
2. Correção de bugs identificados.
3. Criação de documentação básica para o usuário.
4. Preparação do ambiente de produção e revisão final do sistema.

---

## 📦 Pacotes Utilizados

O projeto utiliza os seguintes pacotes Flutter:

- [`http`](https://pub.dev/packages/http): Utilizado para realizar requisições HTTP ao backend ou serviços externos.  
  ```bash
  flutter pub add http
  ```

- [`sqflite`](https://pub.dev/packages/sqflite): Biblioteca para armazenamento local utilizando SQLite em dispositivos móveis.  
  ```bash
  flutter pub add sqflite
  ```

- [`sqflite_common_ffi`](https://pub.dev/packages/sqflite_common_ffi): Permite o uso de SQLite em desktops (Windows, macOS, Linux), tornando o desenvolvimento multiplataforma mais viável.  
  ```bash
  flutter pub add sqflite_common_ffi
  ```

---

## 📁 Estrutura de Pastas

```bash
lib/
├── main.dart
├── models/        # Classes de modelo (Cliente, Endereço, etc.)
├── controllers/   # Controladores responsáveis pela lógica de negócio
├── views/         # Interfaces gráficas (telas)
├── services/      # Serviços auxiliares (ex: autenticação, banco de dados)
└── mocks/         # Objetos simulados para testes
```

---

## 🧪 Testes

Os testes são executados com mocks para isolar as dependências externas, permitindo validar o comportamento de cada componente de forma unitária.

---

## 📝 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
