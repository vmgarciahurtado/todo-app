import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/domain/task/model/task.dart';
import 'package:todo_app/domain/task/service/task_service.dart';
import 'package:todo_app/presentation/shared/cards/custom_loading.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends GetxController {
  final TaskService taskService;

  HomeViewModel({required this.taskService});
  final storage = GetStorage();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxList<Task> listTasks = RxList();

  //** User information */
  String userId = '';
  RxString userName = ''.obs;

  //** Create Task */
  String id = '';
  String title = '';
  String description = '';
  String state = 'true';
  String date = '';

  @override
  void onReady() async {
    await getUserData();
    getUserTasks();
    super.onReady();
  }

  getUserData() async {
    userId = await storage.read('auth');
    userName.value = await storage.read('user_name');
  }

  Future<void> getUserTasks() async {
    CustomLoading(title: 'Loading tasks..');
    List<Task> sortedList = await taskService.getUserTasks(userId);

    sortedList.sort((a, b) {
      int byState = b.state.compareTo(a.state);
      if (byState == 0) {
        return b.date.compareTo(a.date);
      } else {
        return byState;
      }
    });

    listTasks.value = sortedList;
    Get.back();
  }

  Future<void> validateForm() async {
    if (formKey.currentState!.validate()) {
      Get.back();
      CustomLoading(title: 'Saving..');

      id = const Uuid().v4();

      var now = DateTime.now();
      date = DateFormat('yyyy/MM/dd HH:mm').format(now);

      Task task = Task(
          id: id,
          title: title,
          description: description,
          state: state,
          userId: userId,
          date: date);

      bool register = await taskService.createTask(task);
      Get.back();
      if (register) {
        getUserTasks();
      } else {
        Get.snackbar(
          'Error',
          'An error has ocurred, check your internet network and try again.',
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.yellow.shade300,
        );
      }
    }
  }

  Future<void> deteleTask(String taskId) async {
    CustomLoading(title: 'Deleting task..');
    bool task = await taskService.deleteTask(taskId);
    Get.back();
    if (task) {
      getUserTasks();
    } else {
      Get.snackbar(
        'Error',
        'An error has ocurred, check your internet network and try again.',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.yellow.shade300,
      );
    }
  }

  Future<void> updateTask(String taskId, String status) async {
    Get.back();
    CustomLoading(title: 'Saving..');
    bool task = await taskService.updateTask(taskId, status);
    Get.back();
    if (task) {
      getUserTasks();
    } else {
      Get.snackbar(
        'Error',
        'An error has ocurred, check your internet network and try again.',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.yellow.shade300,
      );
    }
  }
}
