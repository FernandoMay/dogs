import 'package:dogs/domain/models/dog.dart';

abstract class DogsRepository {
  Future<List<Dog>> getDogs();
  Future<void> cacheDogs(List<Dog> dogs);
  Future<List<Dog>> getCachedDogs();
}