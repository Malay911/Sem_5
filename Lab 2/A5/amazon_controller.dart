import 'utils/import_export.dart';

class ProductController {
  List<ProductModel> getProducts() {
    return ProductModel.getProducts();
  }
}