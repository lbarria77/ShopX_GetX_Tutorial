import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopx/app/modules/products/controllers/products_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: "Shop X",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
