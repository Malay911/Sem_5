//WAP to create design like e-commerce(Amazon,Flipkart) application dashboard.

// class ProductModel {
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;
//   final double rating;

//   ProductModel({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//     required this.rating,
//   });

//   static List<ProductModel> getProducts() {
//     return [
//       ProductModel(
//         name: 'Wireless Earbuds',
//         description: 'High-quality wireless earbuds with noise cancellation',
//         price: 99.99,
//         imageUrl: 'https://m.media-amazon.com/images/I/71zny7BTRlL._AC_UY218_.jpg',
//         rating: 4.5,
//       ),
//       ProductModel(
//         name: 'Smart Watch',
//         description: 'Fitness tracker with heart rate monitor',
//         price: 149.99,
//         imageUrl: 'https://m.media-amazon.com/images/I/61SSVxTSs3L._AC_UY218_.jpg',
//         rating: 4.3,
//       ),
//       ProductModel(
//         name: 'Laptop',
//         description: '15.6" laptop with latest processor',
//         price: 899.99,
//         imageUrl: 'https://m.media-amazon.com/images/I/81KoSSAwH2L._AC_UY218_.jpg',
//         rating: 4.7,
//       ),
//       ProductModel(
//         name: 'Smartphone',
//         description: '6.5" display with 5G capability',
//         price: 699.99,
//         imageUrl: 'https://m.media-amazon.com/images/I/71AvQd3VzqL._AC_UY218_.jpg',
//         rating: 4.4,
//       ),
//     ];
//   }
// }

class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int reviews;
  final bool isPrime;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.isPrime,
  });

  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        name: 'Apple iPhone 15 Pro Max (256 GB)',
        description: '6.7-inch Super Retina XDR display with ProMotion',
        price: 1199.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/81dT7CUY6GL._AC_UY218_.jpg',
        rating: 4.8,
        reviews: 2584,
        isPrime: true,
      ),
      ProductModel(
        name: 'Samsung Galaxy S24 Ultra',
        description: '6.8" QHD+ Dynamic AMOLED 2X Display',
        price: 1299.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/71YdE55GwjL._AC_UY218_.jpg',
        rating: 4.7,
        reviews: 1853,
        isPrime: true,
      ),
      ProductModel(
        name: 'Apple AirPods Pro (2nd Generation)',
        description: 'Active Noise Cancelling Earbuds',
        price: 249.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_UY218_.jpg',
        rating: 4.8,
        reviews: 45672,
        isPrime: true,
      ),
      ProductModel(
        name: 'Apple Watch Series 9',
        description: 'GPS 45mm Smart Watch',
        price: 399.99,
        imageUrl: 'https://m.media-amazon.com/images/I/71TMn2dnDyL.jpg',
        rating: 4.6,
        reviews: 3421,
        isPrime: true,
      ),
    ];
  }
}
