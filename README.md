# 📦 Sistema de Controle de Endereços — Cronograma de Desenvolvimento

Este repositório contém o desenvolvimento do sistema de controle de endereços. O cronograma está organizado em cinco iterações dentro da Release 1.

---

## 🚀 Release 1

### ✅ Iteração 1: Configuração Inicial e Estrutura do Projeto  
📅 **01/03/2024 a 15/03/2024**  
🎯 **Objetivo:** Preparar o ambiente de desenvolvimento e estabelecer a estrutura base do sistema.

#### Atividades
1. **Configuração do Ambiente:**  
   - IDE, Git, ambientes de desenvolvimento e testes.
2. **Criação da Estrutura do Projeto:**  
   - Organização de pacotes, definição das camadas (modelo, controle, visualização).
3. **Modelagem de Entidades:**  
   - Tabelas do banco de dados e entidades principais.
4. **Protótipo da Interface:**  
   - Esboço inicial das telas.
5. **Mocks:**  
   - Desenvolvimento de objetos simulados para testes unitários, isolando dependências externas.

---

### 🔐 Iteração 2: Cadastro e Autenticação de Usuários  
📅 **16/03/2024 a 30/03/2024**  
🎯 **Objetivo:** Implementar autenticação segura de usuários.

#### Atividades
1. Tela de login com validação de credenciais  
2. Criptografia de senhas  
3. Controle de sessão  
4. Estrutura para controle de permissões futuras

---

### 🧾 Iteração 3: Funcionalidades de Cadastro e Listagem  
📅 **31/03/2024 a 14/04/2024**  
🎯 **Objetivo:** Implementar cadastros e visualização de endereços e clientes.

#### Atividades
1. Formulário de cadastro de endereços  
2. Formulário de cadastro de clientes  
3. Armazenamento dos dados em lista  
4. Listagem de endereços em tabela  
5. Validações nos campos obrigatórios

---

### 🛠 Iteração 4: Edição e Exclusão de Endereços  
📅 **15/04/2024 a 30/04/2024**  
🎯 **Objetivo:** Permitir modificação e remoção de dados, com melhor experiência ao usuário.

#### Atividades
1. Edição de endereços  
2. Exclusão de endereços com confirmação  
3. Mensagens de sucesso/erro  
4. Refinamento da interface

---

### 🧪 Iteração 5: Testes Finais e Preparação para Lançamento  
📅 **01/05/2024 a 15/05/2024**  
🎯 **Objetivo:** Realizar testes finais e preparar o sistema para o lançamento.

#### Atividades
1. Testes de integração e aceitação  
2. Correção de bugs  
3. Documentação do usuário  
4. Preparação do ambiente de produção

---

## 📅 Visão Geral do Cronograma

```mermaid
gantt
    title Cronograma de Desenvolvimento — Release 1
    dateFormat  YYYY-MM-DD
    section Iterações
    Iteração 1: Configuração Inicial        :a1, 2024-03-01, 15d
    Iteração 2: Cadastro e Autenticação     :a2, 2024-03-16, 15d
    Iteração 3: Cadastro e Listagem         :a3, 2024-03-31, 15d
    Iteração 4: Edição e Exclusão           :a4, 2024-04-15, 15d
    Iteração 5: Testes Finais               :a5, 2024-05-01, 15d
