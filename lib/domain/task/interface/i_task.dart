import 'package:todo_app/domain/task/model/task.dart';

abstract class ITaskRepository {
  Future<bool> createTask(Task task);
  Future<List<Task>> getUserTasks(String userId);
  Future<bool> updateTask(String taskId, String state);
  Future<bool> deleteTask(String taskId);
}
