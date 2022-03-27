import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_todo/app/data/services/storage/services.dart';
import 'package:flutter_getx_todo/app/modules/home/binding.dart';
import 'package:flutter_getx_todo/app/modules/home/view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX ToDo',
      home: const HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}

//https://www.youtube.com/watch?v=5uFlee03cg8&list=PLgGlvOHs_ZdB61bfGgznnepmS-L8ly-XN&index=4&t=2s

//time : 11 min
