class Employee implements Comparable<Employee> {
  int id = 0;
  String name = "";
  int age = 0;
  int razryad = 0;
  String position = "";
  double cost = 0;

  Employee(
      {required this.id,
      required this.name,
      required this.age,
      required this.razryad,
      required this.position,
      required this.cost});

  Employee.guard({required this.id, required this.name, required this.age}) {
    razryad = 2;
    position = "Qorovul";
    cost = 3000000;
    Employee(
        id: id,
        name: name,
        age: age,
        razryad: razryad,
        position: position,
        cost: cost);
  }

  Employee.akt({required this.id, required this.name, required this.age}) {
    razryad = 18;
    position = "IT Bo'limi";
    cost = 20000000;
    Employee(
        id: id,
        name: name,
        age: age,
        razryad: razryad,
        position: position,
        cost: cost);
  }

  Employee.intern({required this.id, required this.name, required this.age}) {
    razryad = 1;
    position = "Stajyor";
    cost = 0;
    Employee(
        id: id,
        name: name,
        age: age,
        razryad: razryad,
        position: position,
        cost: cost);
  }

  static List<Employee> list = [];

  factory Employee.add(Employee e1) {
    bool check = false;
    if (list.isNotEmpty) {
      for (var item in list) {
        if (item.id != e1.id) {
          check = true;
        }
      }
      if (check) {
        list.add(e1);
      } else {
        print("Bunday foydalanuvchi mavjud");
      }
    } else {
      list.add(e1);
    }
    return e1;
  }

  @override
  String toString() {
    return "Id => $id, Name => $name, Age => $age, Razryad => $razryad, Position => $position, Const => $cost";
  }

  @override
  int compareTo(Employee other) {
    return other.age.compareTo(age);
  }

  @override
  bool operator ==(Object other) =>
      other is Employee &&
      id == other.id &&
      name == other.name &&
      age == other.age &&
      razryad == other.razryad &&
      position == other.position;

  @override
  int get hashCode => Object.hash(id, name, age, razryad, position, cost);

  static void interface() {
    Employee e1 = Employee.akt(id: 1, name: "Suxrob", age: 21);
    Employee e2 = Employee.guard(id: 4, name: "Usmon", age: 50);
    Employee e3 = Employee.intern(id: 1, name: "MuhammadQodir", age: 70);
    Employee e4 = Employee.akt(id: 1, name: "MuhammadQodir", age: 18);

    Employee.add(e1);
    Employee.add(e2);
    Employee.add(e3);
    Employee.add(e4);

    list.sort();

    for (var element in list) {
      print(element);
    }
  }
}
