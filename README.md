# 📦 Flutter Controle de Endereços (Iteração 01)

Este repositório representa a **iteração 01** do sistema "Flutter Controle de Endereços", desenvolvido utilizando **Flutter** com base em uma arquitetura de camadas para promover separação de responsabilidades, escalabilidade e manutenibilidade.

## 🎯 Objetivo

Criar um sistema de gerenciamento de endereços com suporte a persistência local e comunicação remota via HTTP, seguindo os princípios da arquitetura limpa.

---

## 🧱 Estrutura de Diretórios (`lib/`)

```bash
lib/
├── controller/          # Controladores que fazem a mediação entre a camada visual e as regras de negócio
├── domain/              # Contém os modelos (entidades) da aplicação
├── infra/               # Infraestrutura: persistência de dados local (SQLite), serviços HTTP e Repositórios
├── presentation/        # Componentes visuais e widgets da aplicação
├── service/             # Serviços de negócio ou lógica auxiliar
├── utils/               # Utilitários e constantes utilizadas na aplicação
├── view_model/          # ViewModels para controle de estado e lógica das telas
└── main.dart            # Ponto de entrada do app
```

---

## 🧪 Iteração 01 – Atividades Realizadas

Na primeira iteração, foram realizadas as seguintes atividades:

- ✅ **Configuração da IDE, Git e ambientes de desenvolvimento/teste**
- ✅ **Criação da estrutura de camadas do projeto**:
  - Modelo
  - Controle
  - Visualização (Apresentação)
- ✅ **Modelagem das entidades** (como `Usuario`) e suas respectivas **tabelas de banco de dados**
- ✅ **Protótipo inicial das telas de cadastro e listagem**
- ✅ **Criação de objetos mocks** para testes unitários
- ✅ **Definição dos repositórios (HTTP e local) com interface unificada**
- ✅ **Organização modular em pastas separadas por responsabilidade**

---

## 🧩 Tecnologias e Pacotes Utilizados

- ✅ **Flutter**
- ✅ **Dart**
- 📦 [`http`](https://pub.dev/packages/http) – Comunicação HTTP
- 📦 [`sqflite`](https://pub.dev/packages/sqflite) – Banco de dados SQLite
- 📦 [`sqflite_common_ffi`](https://pub.dev/packages/sqflite_common_ffi) – Suporte a SQLite em testes ou ambiente de desktop

---

## 📐 Arquitetura

O projeto segue uma arquitetura em camadas baseada em princípios de separação de responsabilidades:

- **View**: Interface com o usuário
- **Controller**: Lógica de orquestração da UI com os serviços
- **ViewModel**: Camada intermediária de estado entre view e service
- **Service**: Regras de negócio
- **Infra**: Implementação da persistência (SQLite ou HTTP)
- **Domain**: Definições dos modelos/entidades
- **Utils**: Constantes, helpers, configs globais

---

## 🧪 Testes

Durante essa iteração, foram criados mocks e objetos fake para testes unitários, garantindo testes isolados das camadas e confiabilidade no desenvolvimento.

---

## 📁 Branch

Este repositório encontra-se na branch `prototipo`, que representa a **fase de elaboração** do sistema.

---

## 👨‍💻 Autor

Desenvolvido por [Paulo Dutra](https://github.com/dutrapaulovm)

---

## 📌 Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais informações.
