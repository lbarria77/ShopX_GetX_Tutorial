import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:shopx/app/modules/home/views/product_tile.dart';
import 'package:shopx/app/modules/products/controllers/products_controller.dart';
import 'package:shopx/app/modules/products/views/products_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() { 
              if (productController.isLoading.value)
              return Center(
                child: CircularProgressIndicator(),
              );
              else
              return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            );}),
          ),
        ],
      ),
    );
  }
}
