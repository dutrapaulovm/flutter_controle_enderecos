# Flutter Controle de Endereços - Iteração 02

Este projeto é parte de um sistema para controle de endereços, desenvolvido utilizando o framework Flutter. O objetivo é fornecer uma base sólida para gerenciamento de usuários, sessões e segurança através da arquitetura em camadas e boas práticas de desenvolvimento.

## 📌 Iteração 02 - Funcionalidades Implementadas

Na **Iteração 02**, foram implementadas as seguintes funcionalidades:

- ✅ **Criação da tela de login com validação de credenciais**

  - Interface para entrada de login e senha.
  - Validação dos campos com feedback ao usuário.
  - Autenticação com base nos dados armazenados localmente.

- ✅ **Criptografia das senhas armazenadas**

  - As senhas dos usuários são criptografadas antes de serem salvas no banco de dados.
  - A autenticação compara os hashes para garantir a segurança.

- ✅ **Implementação do controle de sessão**

  - Sessão de usuário ativa após login bem-sucedido.
  - Armazenamento de token/sessão no dispositivo.
  - Logout limpa os dados da sessão.

- ✅ **Estruturação inicial para controle de permissões por tipo de usuário**
  - Diferenciação de acesso com base em perfis de usuário (ex: admin, usuário comum).
  - Base para limitar funcionalidades conforme permissões.

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
- SQLite (armazenamento local)
- SharedPreferences (sessão)
- Hashing (criptografia de senhas)

## 💡 Próximos Passos

- Implementar controle completo de permissões por tela e funcionalidade.
- Integração com backend remoto para autenticação.
- Cadastro de novos usuários.

## 👨‍💻 Autor

Paulo Dutra - [GitHub](https://github.com/dutrapaulovm)

---

Este projeto segue a abordagem de arquitetura limpa e visa manter uma base modular, reutilizável e escalável.
