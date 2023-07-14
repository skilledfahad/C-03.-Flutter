class Car {
  static int numberOfCars = 0;

  String brand;
  String model;
  int year;
  double milesDriven=0;

  Car(this.brand, this.model, this.year) {
    milesDriven;
    numberOfCars++;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  int getAge() {
    return DateTime.now().year - year;
  }
}

void main() {

  Car mycar1=Car("BMW", "i4", 2021);
  mycar1.drive(3000);
  mycar1.drive(10000);
 print("My car 2 details: ${mycar1.getBrand()} ${mycar1.getModel()} (${mycar1.getYear()})\n${mycar1.getMilesDriven()} miles driven,\n${mycar1.getAge()} years old\n");

 Car mycar2 = Car("Ford", "Mustang", 2020);
 mycar2.drive(7000);
 print("My car 2 details: ${mycar2.getBrand()} ${mycar2.getModel()} (${mycar2.getYear()})\n${mycar2.getMilesDriven()} miles driven,\n${mycar2.getAge()} years old\n");

 Car mycar3 = Car("Honda", "Civic", 2016);
 mycar3.drive(20000);
 print("My car 3 details: ${mycar3.getBrand()} ${mycar3.getModel()} (${mycar3.getYear()})\n${mycar3.getMilesDriven()} miles driven,\n${mycar3.getAge()} years old\n");

 print("Number of cars created: ${Car.numberOfCars}");

}