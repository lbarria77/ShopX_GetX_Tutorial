import 'package:get/get.dart';
import 'package:shopx/app/data/model/product.dart';
import 'package:shopx/app/data/services/remote_services.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductsController

  final isLoading = true.obs;
  final productList = <Product>[].obs;

  void fetchProducts() async {
    try {
      isLoading(true);
      final products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      
      isLoading(false);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
