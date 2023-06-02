import 'package:todo_app/domain/task/interface/i_task.dart';
import 'package:todo_app/domain/task/model/task.dart';

class TaskService {
  final ITaskRepository iTaskRepository;

  TaskService({required this.iTaskRepository});

  Future<bool> createTask(Task task) async {
    return await iTaskRepository.createTask(task);
  }

  Future<List<Task>> getUserTasks(String userId) async {
    return await iTaskRepository.getUserTasks(userId);
  }

  Future<bool> updateTask(String taskId, String state) async {
    return await iTaskRepository.updateTask(taskId, state);
  }

  Future<bool> deleteTask(String taskId) async {
    return await iTaskRepository.deleteTask(taskId);
  }
}
