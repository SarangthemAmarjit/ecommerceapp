import 'dart:math';

class MockProduct {
  final int id;
  final String productName;
  final String category;
  final String imagePath;
  final double rating;
  final int reviews;
  final num price;
  final num? discountPrice;
  final num? discountInPercent;
  final bool inStock;

  const MockProduct({
    required this.category,
    required this.id,
    required this.productName,
    required this.imagePath,
    required this.rating,
    required this.reviews,
    required this.price,
    this.discountPrice,
    this.discountInPercent,
    this.inStock = true,
  });
}

final _random = Random();
double _randomRating() => (3 + _random.nextDouble() * 2).toDouble();
int _randomReviews() => 50 + _random.nextInt(450);
num _randomPrice() => 10 + _random.nextInt(90);
num _randomDiscountPrice(num price) {
  return price - (price * (_randomDiscountInPercent() / 100));
}

num _randomDiscountInPercent() => _random.nextInt(30);

List<MockProduct> eCommerceMockproducts =
    [
      (
        1,
        "All Natural Italian-Style Chicken Meatballs",
        "assets/images/static_images/product_images/product_image_15.jpeg",
        "Fresh Food",
      ),
      (
        2,
        "Apple iPhone 11 64GB Yellow Fully Unlocked",
        "assets/images/static_images/product_images/product_image_16.png",
        "Electronics",
      ),
      (
        3,
        "Organic Sweet Lime / Mosambi",
        "assets/images/static_images/product_images/product_image_17.png",
        "Fresh Food",
      ),
      (
        4,
        "Pepperidge Farm Farmhouse Hearty White Bread",
        "assets/images/static_images/product_images/product_image_18.jpeg",
        "Fresh Food",
      ),
      (
        5,
        "Organic Green Seedless Grapes",
        "assets/images/static_images/product_images/product_image_19.png",
        "Fresh Food",
      ),
      (
        6,
        "Lemon Cream Crunch Cookies",
        "assets/images/static_images/product_images/product_image_20.png",
        "Fresh Food",
      ),
      (
        7,
        "Best Bluetooth Headphone",
        "assets/images/static_images/product_images/product_image_21.png",
        "Electronics",
      ),
      (
        8,
        "Apple TV HD 32GB (2nd Generation)",
        "assets/images/static_images/product_images/product_image_22.png",
        "Electronics",
      ),
      (
        9,
        "Premium Cavendish Banana",
        "assets/images/static_images/product_images/product_image_23.jpeg",
        "Fresh Food",
      ),
      (
        10,
        "All Natural Italian-Style Chicken Meatballs",
        "assets/images/static_images/product_images/product_image_24.png",
        "Fresh Food",
      ),
      (
        11,
        "Apple TV HD 32GB (2nd Generation)",
        "assets/images/static_images/product_images/product_image_22.png",
        "Electronics",
      ),
      (
        12,
        "All Natural Italian-Style Chicken Meatballs",
        "assets/images/static_images/product_images/product_image_24.png",
        "Fresh Food",
      ),
    ].asMap().entries.map((item) {
      final price = _randomPrice();
      final discountPrice = _randomDiscountPrice(price);
      return MockProduct(
        id: item.value.$1,
        productName: item.value.$2,
        imagePath: item.value.$3,
        category: item.value.$4,
        rating: _randomRating(),
        reviews: _randomReviews(),
        price: price,
        discountPrice: discountPrice,
        discountInPercent: (100 * (price - discountPrice) / price),
        inStock: _random.nextBool(),
      );
    }).toList();
