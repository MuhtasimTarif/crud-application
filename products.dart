class Product {
  String? id;
  String productName;
  int productCode;
  String img;
  int qty;
  int unitPrice;
  int totalPrice;

  Product({
    this.id,
    required this.productName,
    required this.productCode,
    required this.img,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      productName: json['ProductName'] ?? '',
      productCode: int.tryParse(json['ProductCode'].toString()) ?? 0,
      img: json['Img'] ?? '',
      qty: int.tryParse(json['Qty'].toString()) ?? 0,
      unitPrice: int.tryParse(json['UnitPrice'].toString()) ?? 0,
      totalPrice: int.tryParse(json['TotalPrice'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ProductName": productName,
      "ProductCode": productCode,
      "Img": img,
      "Qty": qty,
      "UnitPrice": unitPrice,
      "TotalPrice": totalPrice,
    };
  }
}