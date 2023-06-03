import 'package:dio/dio.dart';
import 'package:todo_app/domain/task/interface/i_task.dart';
import 'package:todo_app/domain/task/model/task.dart';
import 'package:todo_app/infrastructure/api/firebase_api.dart';

class TaskRepositoryHttp extends ITaskRepository {
  @override
  Future<bool> createTask(Task task) async {
    try {
      Response response = await Api.post('/task', task.toJson());
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteTask(String taskId) async {
    try {
      Response response = await Api.delete('/task/$taskId', {});
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Task>> getUserTasks(String userId) async {
    try {
      Response response = await Api.httpGet('/task/$userId');
      if (response.statusCode == 200 && response.data != []) {
        List<dynamic> responseList = response.data;
        List<Task> list =
            List<Task>.from(responseList.map((e) => Task.fromJson(e)));
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> updateTask(String taskId, String state) async {
    try {
      final data = {'state': state, 'taskId': taskId};
      Response response = await Api.put('/task', data);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
