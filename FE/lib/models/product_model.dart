class ProductModel {
  int id;
  String sku;
  String productName;
  String price;
  String productCategory;
  int stock;

  ProductModel(
      {required this.id,
      required this.sku,
      required this.productName,
      required this.price,
      required this.productCategory,
      required this.stock});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sku': sku,
      'productName': productName,
      'price': price,
      'productCategory': productCategory,
      'stock': stock
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'],
        sku: map['sku'],
        productName: map['productName'],
        price: map['price'],
        productCategory: map['productCategory'],
        stock: map['stock']);
  }
}
