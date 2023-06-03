import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/task/service/task_service.dart';
import 'package:todo_app/infrastructure/task/task_repository_http.dart';
import 'package:todo_app/presentation/home/view_model/view_model.dart';
import 'package:todo_app/presentation/home/widgets/dialog_create_task.dart';
import 'package:todo_app/presentation/home/widgets/task_item.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final viewModel = Get.put(HomeViewModel(
      taskService: TaskService(iTaskRepository: TaskRepositoryHttp())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.arrow_left)),
                const Spacer(),
                Obx(() => Text(
                      'Hi, ${viewModel.userName.value}',
                      style: TextStyles.titleStyle(),
                    )),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.dialog(DialogCreateTask(
                      viewModel: viewModel,
                    ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colores.secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: const Icon(CupertinoIcons.add)),
                ),
                const SizedBox(width: 20)
              ],
            ),
            Obx(
              () => Visibility(
                  visible: viewModel.listTasks.isEmpty,
                  child: Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 200),
                          Text(
                            'No Tasks Yet',
                            style: TextStyles.subTitle2Style(),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            Obx(() => Visibility(
                  visible: viewModel.listTasks.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Tasks',
                      style: TextStyles.subTitle2Style(),
                    ),
                  ),
                )),
            Expanded(
              child: Obx(() => Visibility(
                    visible: viewModel.listTasks.isNotEmpty,
                    child: ListView.builder(
                      itemCount: viewModel.listTasks.length,
                      itemBuilder: (BuildContext context, int position) {
                        return TaskItem(
                          viewModel: viewModel,
                          task: viewModel.listTasks[position],
                        );
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
