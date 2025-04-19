# 📦 Flutter Controle de Endereços (Protótipo)

Protótipo de um sistema de controle de endereços desenvolvido em Flutter. O projeto utiliza uma arquitetura limpa com camadas bem definidas, repositórios genéricos, e uma estrutura padrão de respostas para operações internas.

---

## 🧩 Estrutura do Projeto

A estrutura do código em `lib/` está organizada por camadas:

```
lib/
├── domain/
│   ├── models/          # Entidades de domínio (ex: Usuario)
│   └── repositories/    # Interfaces dos repositórios (IRepository<T>)
└── infra/
    └── repositories/    # Implementações concretas dos repositórios (Fake, Local, HTTP)
    └── result_application.dart  # Classe padrão de retorno
```

---

## 🧪 Status Atual

- ✅ Repositório Fake implementado
- 🧪 Protótipo funcional para simular CRUD de usuários
- 🚧 Foco atual: desenvolvimento e testes com dados simulados

---

## 🔄 Estratégia de Seleção de Repositório

A aplicação utilizará **um único repositório por vez**, comutando automaticamente com base na conectividade de rede:

- **Offline**: Repositório Local (`UsuarioRepositoryLocal`)
- **Online**: Repositório HTTP (`UsuarioRepositoryHttp`)

Essa seleção pode ser feita dinamicamente durante o carregamento da aplicação com base em verificações via `connectivity_plus`.

```dart
late final IRepository<Usuario> repository;

Future<void> setupRepository() async {
  final isOnline = await Connectivity().checkConnectivity() != ConnectivityResult.none;
  repository = isOnline
      ? UsuarioRepositoryHttp()
      : UsuarioRepositoryLocal();
}
```

---

## 💡 Repositórios Implementados

### ✅ Fake

```dart
UsuarioRepositoryFake implements IRepository<Usuario>
```

- Armazena dados em memória
- Ideal para protótipos e testes de UI
- Simula delays para operações assíncronas

### 📦 Em Desenvolvimento

- `UsuarioRepositoryLocal` — com SQLite
- `UsuarioRepositoryHttp` — consumo de API RESTful

---

## 📦 Classe: ResultApplication<T>

Todas as operações dos repositórios retornam um `ResultApplication<T>` como padrão.

```dart
class ResultApplication<T> {
  bool success;
  String? message;
  String? token;
  T? data;
  dynamic errors;
  String? status;
}
```

### Exemplo:

```dart
final result = await repository.insert(usuario);
if (result.success) {
  print('Usuário salvo: ${result.data}');
} else {
  print('Erro: ${result.message}');
}
```

---

## 🚀 Planos Futuros

- [x] Estrutura inicial com repositório fake
- [ ] Implementação do repositório local (SQLite)
- [ ] Implementação do repositório remoto (HTTP)
- [ ] Comutação automática de repositório (offline/online)
- [ ] Telas de cadastro e listagem de usuários
- [ ] Validação de formulários
- [ ] Login + autenticação básica (mock ou JWT)

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Abra uma issue com sugestões, correções ou melhorias. Durante a fase de prototipagem, todo feedback é essencial.

---

## 👨‍💻 Autor

Desenvolvido com ❤️ por [Paulo Dutra](https://github.com/dutrapaulovm)

---

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
