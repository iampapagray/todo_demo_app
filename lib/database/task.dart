import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String taskName;

  bool taskCompleted = false;
}
