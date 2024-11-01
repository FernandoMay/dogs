
import 'package:dogs/data/datasources/local/database_helper.dart';
import 'package:dogs/data/datasources/remote/dogs_api_service.dart';
import 'package:dogs/domain/models/dog.dart';
import 'package:dogs/domain/repositories/dogs_repository.dart';

class DogsRepositoryImpl implements DogsRepository {
  final DogsApiService apiService = DogsApiService();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Future<List<Dog>> getDogs() async {
    try {
      final cachedDogs = await getCachedDogs();
      if (cachedDogs.isNotEmpty) {
        return cachedDogs;
      }
      
      final dogs = await apiService.fetchDogs();
      await cacheDogs(dogs);
      return dogs;
    } catch (e) {
      return await getCachedDogs();
    }
  }

  @override
  Future<void> cacheDogs(List<Dog> dogs) async {
    await dbHelper.insertDogs(dogs);
  }

  @override
  Future<List<Dog>> getCachedDogs() async {
    return await dbHelper.getDogs();
  }
}