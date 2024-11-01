import 'package:hive/hive.dart';
import 'package:dogs/domain/models/dog.dart';

class DogAdapter extends TypeAdapter<Dog> {
  @override
  final int typeId = 0;
  @override
  Dog read(BinaryReader reader) {
    final dogName = reader.readString();
    final description = reader.readString();
    final age = reader.readInt();
    final image = reader.readString();
    return Dog(dogName: dogName, description: description, age: age, image: image);
  }

  @override
  void write(BinaryWriter writer, Dog obj) {
    writer.writeString(obj.dogName);
    writer.writeString(obj.description);
    writer.writeInt(obj.age);
    writer.writeString(obj.image);
  }
}