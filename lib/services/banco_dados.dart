import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/registro_humor.dart';

class BancoDados {
  static final BancoDados instance = BancoDados._init();
  static Database? _database;

  BancoDados._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mood_io.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Cria a tabela
  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE registros (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT NOT NULL,
      humor TEXT NOT NULL,
      observacao TEXT
    )
    ''');
  }

  // CREATE: Salvar novo humor
  Future<int> criar(RegistroHumor registro) async {
    final db = await instance.database;
    return await db.insert('registros', registro.toMap());
  }

  // READ: Ler todos os registros
  Future<List<RegistroHumor>> lerTodos() async {
    final db = await instance.database;
    final result = await db.query('registros', orderBy: 'data DESC'); // Mais recente primeiro
    return result.map((json) => RegistroHumor.fromMap(json)).toList();
  }

  // UPDATE: Atualizar
  Future<int> atualizar(RegistroHumor registro) async {
    final db = await instance.database;
    return db.update(
      'registros',
      registro.toMap(),
      where: 'id = ?',
      whereArgs: [registro.id],
    );
  }

  // DELETE: Apagar
  Future<int> deletar(int id) async {
    final db = await instance.database;
    return await db.delete(
      'registros',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}