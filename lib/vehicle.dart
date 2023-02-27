class Vehicle implements Comparable<Vehicle> {
  String model = "";
  double price = 0;
  String type = "";
  int trunkCount = 0;

  Vehicle(
      {required this.model,
      required this.price,
      required this.type,
      required this.trunkCount});

  Vehicle.truck({required this.model, required this.price}) {
    type = "Yuk mashinasi";
    trunkCount = 8;
    Vehicle(model: model, price: price, type: type, trunkCount: trunkCount);
  }

  Vehicle.bus({required this.model, required this.price}) {
    type = "Avtobus";
    trunkCount = 12;
    Vehicle(model: model, price: price, type: type, trunkCount: trunkCount);
  }

  Vehicle.sport({required this.model, required this.price}) {
    type = "Sport avtomobili";
    trunkCount = 4;
    Vehicle(model: model, price: price, type: type, trunkCount: trunkCount);
  }

  Vehicle.car({required this.model, required this.price}) {
    type = "Standart avtomobil";
    trunkCount = 4;
    Vehicle(model: model, price: price, type: type, trunkCount: trunkCount);
  }

  @override
  bool operator ==(Object other) {
    return other is Vehicle &&
        trunkCount == other.trunkCount &&
        model == other.model &&
        type == other.type &&
        trunkCount == other.trunkCount;
  }

  @override
  int get hashCode => Object.hash(trunkCount, type, model, price);

  @override
  String toString() {
    return "Model => $model, Price => $price, Type => $type, TrunkCount => $trunkCount";
  }

  @override
  int compareTo(Vehicle other) {
    return price.compareTo(other.price);
  }

  static void interface() {
    Vehicle truck1 = Vehicle.truck(model: "Mercedes", price: 50000);
    Vehicle truck2 = Vehicle.truck(model: "Mercedes", price: 50000);
    Vehicle bus1 = Vehicle.bus(model: "Icarus", price: 80000);
    Vehicle bus2 = Vehicle.bus(model: "Setra", price: 70000);
    Vehicle sportCar1 = Vehicle.sport(model: "Bugatti", price: 10000000);
    Vehicle sportCar2 = Vehicle.sport(model: "Bmw", price: 200000);
    Vehicle car1 = Vehicle.car(model: "Cobalt", price: 12000);
    Vehicle car2 = Vehicle.car(model: "Gentra", price: 13000);

    List<Vehicle> list = [
      truck1,
      truck2,
      bus1,
      bus2,
      sportCar1,
      sportCar2,
      car1,
      car2
    ];
    for (var element in list) {
      print(element);
    }
    print("Sort");
    list.sort();
    for (var element in list) {
      print(element);
    }

    Set<Vehicle> set = {truck1, truck2, bus1};
    print(set);
  }
}
