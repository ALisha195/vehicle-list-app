class Vehicle {
  final String name;
  final int mileage;
  final int year;

  Vehicle({required this.name, required this.mileage, required this.year});

  int get age => DateTime.now().year - year;

  String getCategory() {
    if (mileage >= 15 && age <= 5) {
      return "Green"; // Fuel-efficient & Low pollutant
    } else if (mileage >= 15 && age > 5) {
      return "Amber"; // Fuel-efficient but Moderately Pollutant
    } else {
      return "Red"; // High pollutant
    }
  }
}
