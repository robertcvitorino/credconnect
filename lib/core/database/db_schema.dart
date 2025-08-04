// lib/data/datasources/db_schema.dart
// ignore_for_file: constant_identifier_names

class DbSchema {
  // --- Tabela para o Pool de Crédito ---
  // Armazena o valor total disponível para empréstimos.
  static const String CREATECREDITPOOLTABLE = '''
    CREATE TABLE credit_pool(
      id INTEGER PRIMARY KEY,
      value REAL NOT NULL
    )
  ''';

  // --- Tabela de Usuários ---
  // Usuários que podem fazer login no aplicativo.
  static const String CREATEUSERSTABLE = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      phone TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    )
  ''';

  // --- Tabela de Clientes ---
  // Clientes que podem receber os empréstimos.
  static const String CREATECLIENTSTABLE = '''
    CREATE TABLE clients(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      gender TEXT,
      birth_date TEXT,
      address TEXT,
      nid TEXT NOT NULL UNIQUE
    )
  ''';

  // --- Tabela de Empréstimos ---
  // (Opcional, mas útil) Registra cada solicitação de empréstimo.
  static const String CREATELOANSTABLE = '''
    CREATE TABLE loans(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      client_id INTEGER NOT NULL,
      value REAL NOT NULL,
      installments INTEGER NOT NULL,
      interest_rate REAL NOT NULL,
      request_date TEXT NOT NULL,
      status TEXT NOT NULL,
      FOREIGN KEY (client_id) REFERENCES clients (id)
    )
  ''';
}