
import 'package:dogs/data/datasources/remote/dogs_api_service.dart';
import 'package:dogs/domain/models/dog.dart';
import 'package:dogs/domain/models/repositories/dogs_repository.dart';

class DogsRepositoryImpl implements DogsRepository {
  final DogsApiService apiService = DogsApiService();
  
  @override
  Future<List<Dog>> getDogs() async {
    try {
      final dogs = await apiService.fetchDogs();
      return dogs;
    } catch (e) {
      rethrow;
    }
  }
}