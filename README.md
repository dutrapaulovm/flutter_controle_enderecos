# Flutter Controle de Endereços - Iteração 03

Este projeto é parte de um sistema para controle de endereços, desenvolvido utilizando o framework Flutter. O objetivo é fornecer uma base sólida para gerenciamento de usuários, endereços, clientes e sessões, utilizando arquitetura em camadas e boas práticas de desenvolvimento.

## 📌 Iteração 03 - Funcionalidades Implementadas

Na **Iteração 03**, foram implementadas as seguintes funcionalidades:

- ✅ **Cadastro de Endereços**

  - Formulário com campos obrigatórios para inserção de endereços.
  - Validação dos campos com feedback ao usuário.

- ✅ **Cadastro de Clientes**

  - Formulário para inserção dos dados dos clientes.
  - Validação dos campos obrigatórios.

- ✅ **Armazenamento em Estrutura Interna**

  - Armazenamento dos dados de endereços e clientes em listas internas.
  - Estrutura preparada para futura persistência em banco de dados.

- ✅ **Listagem de Endereços**
  - Exibição dos endereços cadastrados em formato de tabela.
  - Visualização clara e organizada dos dados inseridos.

## 🗂️ Estrutura das Pastas (Atualizada)

```
lib/
├── controller/          # Lógica de controle e intermediação entre camadas
├── domain/              # Modelos, entidades e contratos de repositórios
├── infra/               # Implementações concretas (ex: repositórios, serviços)
├── presentation/        # Telas e widgets da interface do usuário
├── service/             # Regras de negócio e validações
├── utils/               # Funções utilitárias e constantes
├── view_model/          # Lógica das telas separada da interface
```

## 🚀 Tecnologias Utilizadas

- Flutter 3.x
- Dart
- SQLite (planejado para persistência futura)
- SharedPreferences (sessão)
- Hashing (criptografia de senhas)

## 💡 Próximos Passos

- Implementar controle completo de permissões por tela e funcionalidade.
- Integração com backend remoto para autenticação e persistência.
- Cadastro e listagem de clientes com persistência local.

## 👨‍💻 Autor

Paulo Dutra - [GitHub](https://github.com/dutrapaulovm)

---

Este projeto segue a abordagem de arquitetura limpa e visa manter uma base modular, reutilizável e escalável.
