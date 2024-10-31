import 'package:dogs/domain/models/dog.dart';

abstract class DogsRepository {
  Future<List<Dog>> getDogs();
}