import 'package:e_book_store/models/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    try {
      var response = await client.get(
        Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
        ),
      );

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
