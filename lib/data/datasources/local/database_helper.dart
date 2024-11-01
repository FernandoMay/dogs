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