import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/task/model/task.dart';
import 'package:todo_app/presentation/home/view_model/view_model.dart';
import 'package:todo_app/presentation/shared/cards/custom_card.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.viewModel, required this.task});

  final HomeViewModel viewModel;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              CustomCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                body: SizedBox(
                  height: 110,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: task.state == 'true'
                                ? Colores.primaryColor
                                : Colors.green,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 310,
                            child: Text(
                              task.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.subTitleStyle(
                                  color: Colores.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 320,
                            height: 65,
                            child: Text(
                              task.description,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.headlineStyle(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            task.date,
                            style: TextStyles.subHeadLineStyle(
                                color: Colores.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Row(
            children: [
              const SizedBox(
                height: 45,
              ),
              InkWell(
                onTap: () {},
                child: const Image(
                    height: 30, image: AssetImage('assets/icons/edit.png')),
              ),
              InkWell(
                onTap: () {
                  viewModel.deteleTask(task.id);
                },
                child: const Image(
                    height: 30, image: AssetImage('assets/icons/remove.png')),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
