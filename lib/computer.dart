class Computer implements Comparable<Computer> {
  int _serialNumber = 0;
  String model;
  String _processor = "";
  double price;
  String type = "";

  Computer({required this.model, required this.price});

  Computer.laptop({required this.model, required this.price}) {
    _serialNumber = 111;
    _processor = "Core-i5";
    type = "Laptop";
  }

  Computer.desktop({required this.model, required this.price}) {
    _serialNumber = 999;
    _processor = "Core-i9";
    type = "Desktop";
  }

  static List<Computer> list = [];

  factory Computer.add(Computer computer) {
    bool check = true;
    if (list.isNotEmpty) {
      for (var element in list) {
        if (element.model == computer.model) {
          check = false;
        }
      }
      if (check) {
        Computer(model: computer.model, price: computer.price);
        list.add(computer);
      } else {
        print("Bunday modellik kompyuter mavjud !");
      }
    } else {
      Computer(model: computer.model, price: computer.price);
      list.add(computer);
    }
    return computer;
  }

  @override
  String toString() {
    return "Model => $model, SerialNumber => $_serialNumber, Processor => $_processor, Price => $price, Type => $type";
  }

  @override
  bool operator ==(Object other) =>
      (other is Computer) &&
      model == other.model &&
      price == other.price &&
      type == other.type &&
      _serialNumber == other._serialNumber &&
      _processor == other._processor;

  @override
  int get hashCode =>
      Object.hash(_serialNumber, _processor, model, price, type);

  @override
  int compareTo(Computer other) {
    return other.price.compareTo(price);
  }

  static void interface() {
    Computer desktop2 = Computer.desktop(model: "Hp", price: 10000000);
    Computer laptop1 = Computer.laptop(model: "Asus", price: 5000000);
    Computer laptop2 = Computer.laptop(model: "Lenovo", price: 4000000);
    Computer desktop1 = Computer.desktop(model: "Gigabyte", price: 12000000);

    Computer.add(desktop2);
    Computer.add(laptop1);
    Computer.add(laptop2);
    Computer.add(desktop1);

    list.sort();

    for (var element in list) {
      print(element);
    }
  }
}
