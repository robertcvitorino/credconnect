

class DbSchema {
  static const String CREATECREDITPOOLTABLE = '''
    CREATE TABLE credit_pool(
      id INTEGER PRIMARY KEY,
      value REAL NOT NULL
    )
  ''';

  static const String CREATEUSERSTABLE = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      phone TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    )
  ''';

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
  static const String CREATELOANSTABLE = '''
    CREATE TABLE loans(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      client_id INTEGER NOT NULL,
      value TEXT NOT NULL,
      term TEXT NOT NULL,
      tax TEXT NOT NULL,
      request_date TEXT NOT NULL,
      FOREIGN KEY (client_id) REFERENCES clients (id)
    )
  ''';
}