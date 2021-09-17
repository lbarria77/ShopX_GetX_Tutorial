import 'package:http/http.dart' as http;
import 'package:shopx/app/data/model/product.dart';

// class RemoteServices {
//   static var client = http.Client();
//   // final url = Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');

//   static Future<List<Product>> fetchProducts() async {
//     var response = await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

//     if (response == 200) {
//       var data = response.body;
//       return productFromJson(data);
      
//     } else {
//       return [];
//     }
//   }
// }

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return [];
    }
  }
}