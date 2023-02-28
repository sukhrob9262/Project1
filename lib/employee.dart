import 'dart:io';
import 'dart:math';

class Employee implements Comparable<Employee> {
  int id = 0;
  String name = "";
  int age = 0;
  int razryad = 0;
  String position = "";
  double cost = 0;
  static int commandSort = 1;
  static List<Employee> list = [];

  Employee(
      {required this.id,
      required this.name,
      required this.age,
      required this.razryad,
      required this.position,
      required this.cost});

  Employee.guard({required this.name, required this.age}) {
    id = random.nextInt(1000);
    razryad = 2;
    position = "qorovul";
    cost = 3000000;

    Employee e1 = Employee(
        id: id,
        name: name,
        age: age,
        razryad: razryad,
        position: position,
        cost: cost);
    list.add(e1);
  }

  Random random = Random();

  Employee.akt({required this.name, required this.age}) {
    id = random.nextInt(1000);
    razryad = 18;
    position = "IT Bo'limi";
    cost = 20000000;

    Employee e1 = Employee(
        id: id,
        name: name,
        age: age,
        razryad: razryad,
        position: position,
        cost: cost);
    list.add(e1);
  }

  Employee.intern({required this.name, required this.age}) {
    id = random.nextInt(1000);
    razryad = 1;
    position = "Stajyor";
    cost = 0;

    Employee e1 = Employee(
        id: id,
        name: name,
        age: age,
        razryad: razryad,
        position: position,
        cost: cost);
    list.add(e1);
  }

  Employee.create(
      {required String name, required int age, required String position}) {
    bool check = true;
    for (var item in list) {
      if (item.name != name) {
        check = true;
      }
    }
    if (check) {
      if (position.toLowerCase() == "akt") {
        Employee.akt(name: name, age: age);
      } else if (position.toLowerCase() == "qorovul") {
        Employee.guard(name: name, age: age);
      } else {
        Employee.intern(name: name, age: age);
      }
    } else {
      print("Bunday foydalanuvchi mavjud \n");
    }
  }

  @override
  String toString() {
    return "Id => $id, Name => $name, Age => $age, Razryad => $razryad, Position => $position, Const => $cost \n";
  }

  @override
  int compareTo(Employee other) {
    if (commandSort == 1) {
      return name.compareTo(other.name);
    }
    if (commandSort == 2) {
      return other.age.compareTo(age);
    }
    else {
      return other.cost.compareTo(cost);
    }

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
    while (true) {
      stdout.write(
          "1.Xodim qo'shish \n2.Xodimlarni tartiblash \n3.Barcha xodimlar \n0.Chiqsh \n");
      int command = int.tryParse(stdin.readLineSync()!) ?? 0;
      switch (command) {
        case 1:
          {
            stdout.write("1.AKT bo'limi \n2.Stajyor \n3.Qorovul \n0.Orqaga \n");
            int command = int.tryParse(stdin.readLineSync()!) ?? 0;
            switch (command) {
              case 1:
                {
                  stdout.write("Xodim ism familiyasini kiriting => ");
                  String name = stdin.readLineSync()!;
                  stdout.write("Xodim yoshini kiriting => ");
                  int age = int.tryParse(stdin.readLineSync()!) ?? 0;
                  String position = "akt";
                  Employee.create(name: name, age: age, position: position);
                  print("Xodim kiritildi ! \n");
                  break;
                }
              case 2:
                {
                  stdout.write("Stajyor ism familiyasini kiriting => ");
                  String name = stdin.readLineSync()!;
                  stdout.write("Stajyor yoshini kiriting => ");
                  int age = int.tryParse(stdin.readLineSync()!) ?? 0;
                  String position = "stajyor";
                  Employee.create(name: name, age: age, position: position);
                  print("Stajyor kiritildi ! \n");
                  break;
                }
              case 3:
                {
                  stdout.write("Qorovul ism familiyasini kiriting => ");
                  String name = stdin.readLineSync()!;
                  stdout.write("Qorovul yoshini kiriting => ");
                  int age = int.tryParse(stdin.readLineSync()!) ?? 0;
                  String position = "qorovul";
                  Employee.create(name: name, age: age, position: position);
                  print("Qorovul kiritildi ! \n");
                  break;
                }
            }
            break;
          }
        case 2:
          {
            stdout.write(
                "1.Ism boyicha (a-z) \n2.Yosh bo'yicha (max-min) \n3.Oylik bo'yicha (max-min) \n");
            commandSort = int.tryParse(stdin.readLineSync()!) ?? 1;
            switch (command) {
              case 1:
                {
                  list.sort();
                  print("Ism bo'yicha tartiblandi ! \n");
                  break;
                }
              case 2:
                {
                  list.sort();
                  print("Yosh bo'yicha tartiblandi ! \n");
                  break;
                }
              case 3:
                {
                  print("Oylik bo'yicha tartiblandi ! '\n");
                  list.sort();
                  break;
                }
            }
            break;
          }
        case 3:
          {
            for (var element in list) {
              print(element);
            }
            break;
          }
      }
    }
  }
}
