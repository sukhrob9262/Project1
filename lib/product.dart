class Product implements Comparable<Product> {
  String name = "";
  int price = 0;
  String type = "";

  Product({required this.name, required this.price, required this.type});

  Product.fruit({required this.name, required this.price}) {
    type = "Meva";
  }

  Product.drink({required this.name, required this.price}) {
    type = "Ichimlik";
  }

  static List<Product> list = [];

  factory Product.add(Product product) {
    if (list.isNotEmpty) {
      bool check = false;
      for (var item in list) {
        if (item.name == product.name) {
          check = true;
        }
      }
      if (!check) {
        list.add(product);
        Product(name: product.name, price: product.price, type: product.type);
      } else {
        print("Bunday Product mavjud");
      }
    } else {
      list.add(product);
      Product(name: product.name, price: product.price, type: product.type);
    }
    return product;
  }

  @override
  String toString() {
    return "Name => $name, Price => $price, Type => $type";
  }

  @override
  bool operator ==(Object other) =>
      other is Product &&
      name == other.name &&
      price == other.price &&
      type == other.type;

  @override
  int get hashCode => Object.hash(name, price, type);

  @override
  int compareTo(Product other) {
    return other.price.compareTo(price);
  }

  static void interface() {
    Product drink1 = Product.drink(name: "Coca cola", price: 12000);
    Product drink2 = Product.drink(name: "Fanta", price: 11000);
    Product fruit1 = Product.fruit(name: "Olma", price: 17000);
    Product fruit2 = Product.fruit(name: "Apelsin", price: 30000);

    Product.add(fruit1);
    Product.add(drink2);
    Product.add(fruit2);
    Product.add(drink1);

    list.sort();

    for (var element in list) {
      print(element);
    }
  }
}
