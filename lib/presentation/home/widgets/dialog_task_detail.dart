import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/domain/task/model/task.dart';
import 'package:todo_app/presentation/home/view_model/view_model.dart';
import 'package:todo_app/presentation/shared/buttons/rounded_button.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class DialogTaskDetail extends StatelessWidget {
  const DialogTaskDetail(
      {super.key, required this.task, required this.viewModel});
  final Task task;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Colores.grayBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Material(
          color: Colores.grayBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Task Detail',
                style: TextStyles.titleStyle(),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade400)),
                child: SizedBox(
                  width: 320,
                  height: 70,
                  child: Text(
                    task.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.headlineStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade400)),
                child: SizedBox(
                  width: 320,
                  height: 70,
                  child: Text(
                    task.enDescription ?? 'No Enlighs Description',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.headlineStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  task.state == 'true'
                      ? Expanded(
                          child: CustomButton(
                            onPressed: () {
                              viewModel.updateTask(task.id, 'false');
                            },
                            text: 'Done',
                            backgroundColor: Colors.green,
                            rightIcon: const Icon(
                              CupertinoIcons.check_mark_circled,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Expanded(
                          child: CustomButton(
                            onPressed: () {
                              viewModel.updateTask(task.id, 'true');
                            },
                            text: 'Doing',
                            backgroundColor: Colores.secondaryColor,
                            rightIcon: const Icon(
                              CupertinoIcons.check_mark_circled,
                              color: Colors.white,
                            ),
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
