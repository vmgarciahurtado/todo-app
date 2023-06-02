import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/domain/task/model/task.dart';
import 'package:todo_app/domain/task/service/task_service.dart';
import 'package:todo_app/presentation/shared/cards/custom_loading.dart';

class HomeViewModel extends GetxController {
  final TaskService taskService;

  HomeViewModel({required this.taskService});

  RxList<Task> listTasks = RxList();
  String userId = '';
  final storage = GetStorage();

  @override
  void onReady() async {
    await getUserId();
    getUserTasks();
    super.onReady();
  }

  getUserId() async {
    userId = await storage.read('auth');
  }

  Future<void> getUserTasks() async {
    CustomLoading(title: 'Loading tasks..');
    listTasks.value = await taskService.getUserTasks(userId);
    Get.back();
  }
}
