import 'package:dogs/domain/adapters/dog_adapter.dart';
import 'package:dogs/domain/models/dog.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const String boxName = 'dogs_box';

  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(DogAdapter());
  }

  Future<void> insertDogs(List<Dog> dogs) async {
    final box = await Hive.openBox<Dog>(boxName);
    await box.clear();
    await box.addAll(dogs);
  }

  Future<List<Dog>> getDogs() async {
    final box = await Hive.openBox<Dog>(boxName);
    return box.values.toList();
  }
}

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static Database? _database;
//   static const String tableDogs = 'dogs';

//   Future<void> init() async {
//     _database = await openDatabase(
//       join(await getDatabasesPath(), 'dogs_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE $tableDogs(dogName TEXT PRIMARY KEY, description TEXT, age INTEGER, image TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<void> insertDogs(List<Dog> dogs) async {
//     final db = _database;
//     if (db == null) return;

//     await db.delete(tableDogs);
    
//     for (var dog in dogs) {
//       await db.insert(
//         tableDogs,
//         dog.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//   }

//   Future<List<Dog>> getDogs() async {
//     final db = _database;
//     if (db == null) return [];

//     final List<Map<String, dynamic>> maps = await db.query(tableDogs);
//     return List.generate(maps.length, (i) => Dog.fromJson(maps[i]));
//   }
// }