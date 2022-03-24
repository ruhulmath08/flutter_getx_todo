import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_todo/app/core/utils/extensions.dart';
import 'package:flutter_getx_todo/app/modules/home/controller.dart';
import 'package:get/get.dart';

class AddDialog extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homeController.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      homeController.taskTypeEditController.clear();
                      homeController.changeTask(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  TextButton(
                    onPressed: () {
                      if (homeController.formKey.currentState!.validate()) {
                        if (homeController.task.value == null) {
                          EasyLoading.showError('Please select task type');
                        } else {
                          var success = homeController.updateTask(
                            homeController.task.value!,
                            homeController.taskTypeEditController.text,
                          );
                          if (success) {
                            EasyLoading.showSuccess('Todo item added successfully');
                            Get.back();
                            homeController.changeTask(null);
                          } else {
                            EasyLoading.showError('Todo item already exist');
                          }
                          homeController.taskTypeEditController.clear();
                        }
                      }
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 14.0.sp),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text(
                'New Task',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeController.taskTypeEditController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your item';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.wp).copyWith(bottom: 2.0.wp),
              child: Text(
                'Add to',
                style: TextStyle(
                  fontSize: 14.0.sp,
                  color: Colors.grey,
                ),
              ),
            ),
            ...homeController.tasks
                .map(
                  (element) => Obx(
                    () => InkWell(
                      onTap: () => homeController.changeTask(element),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.0.wp,
                          vertical: 4.0.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  IconData(element.icon, fontFamily: 'MaterialIcons'),
                                  color: HexColor.fromHex(element.color),
                                ),
                                SizedBox(width: 3.0.wp),
                                Text(
                                  element.title,
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (homeController.task.value == element) const Icon(Icons.check, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
