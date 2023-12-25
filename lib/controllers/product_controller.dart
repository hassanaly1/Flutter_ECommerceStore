import 'package:e_book_store/models/product_model.dart';
import 'package:e_book_store/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var books = await RemoteServices.fetchProducts();
    productList.value = books;
    filteredProducts.value = productList;
  }

  void filterProducts(String keyword) {
    print("Filtering products with keyword: $keyword");
    keyword = keyword.trim(); // Trim white spaces
    if (keyword.isEmpty) {
      print("Keyword is empty. Setting filteredProducts to productList.");
      filteredProducts.value = productList;
    } else {
      filteredProducts.value = productList
          .where((product) => (product.name?.toLowerCase() ?? '')
              .contains(keyword.toLowerCase()))
          .toList();
    }
    print("Filtered products count: ${filteredProducts.length}");
  }
}
