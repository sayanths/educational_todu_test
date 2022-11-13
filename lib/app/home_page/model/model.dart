import 'package:hive_flutter/hive_flutter.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
   int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;

  Model({
    required this.title,
    this.description,
  });
}
