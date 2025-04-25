class AppSQL {
  static const String sql = '''
      -- Criação da tabela de fornecedores
      CREATE TABLE fornecedores (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL DEFAULT ''
      );

      -- Criação da tabela de clientes
      CREATE TABLE clientes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL DEFAULT ''
      );

      -- Criação da tabela de contas a pagar
      CREATE TABLE contaspagar (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          descricao TEXT NOT NULL DEFAULT '',
          valor REAL NOT NULL DEFAULT 0,
          data_vencimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          status TEXT NOT NULL DEFAULT 'A',
          fornecedor_id INTEGER NOT NULL,
          FOREIGN KEY (fornecedor_id) REFERENCES fornecedores (id)
      );

      -- Criação da tabela de contas a receber
      CREATE TABLE contasreceber (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          descricao TEXT NOT NULL DEFAULT '',
          valor REAL NOT NULL DEFAULT 0,
          data_vencimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          status TEXT NOT NULL DEFAULT 'A',
          cliente_id INTEGER NOT NULL,
          FOREIGN KEY (cliente_id) REFERENCES clientes (id)
      );

    ''';
}
