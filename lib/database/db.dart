import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/database/task.dart';

class Database {
  late Future<Isar> db;

  Database() {
    db = openDB();
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<void> saveTask(Task newTask) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.tasks.putSync(newTask));
  }

  Future<List<Task>> getAllTasks() async {
    final isar = await db;
    return await isar.tasks.where().findAll();
  }

  Stream<List<Task>> listenToTasks() async* {
    final isar = await db;
    yield* isar.tasks.where().watch(fireImmediately: true);
  }

  Future<void> updateTask(Task oldTask) async {
    final isar = await db;
    final existingTask = await isar.tasks.get(oldTask.id);
    if (existingTask != null) {
      await isar.writeTxn(() async {
        await isar.tasks.put(oldTask);
      });
    }
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([TaskSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
