class Smartphone {
  String? id;
  String brand;
  String model;
  int price;
  int storage;

  Smartphone({this.id, required this.brand, required this.model, required this.price, required this.storage});

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'model': model,
      'price': price,
      'storage': storage,
    };
  }

  Smartphone.fromMap(Map<String, dynamic> map, {this.id})
      : brand = map['brand'],
        model = map['model'],
        price = map['price'],
        storage = map['storage'];
}
