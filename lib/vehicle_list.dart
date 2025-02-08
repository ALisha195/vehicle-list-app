import 'package:flutter/material.dart';
import 'package:vehicle_list_app/api_service.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  late Future<List<dynamic>> vehicles;
  final ApiService apiService = ApiService(); // Create an instance of ApiService

  @override
void initState() {
  super.initState();
  vehicles = ApiService().fetchVehicles(); // ✅ Correct method call
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle List")),
      body: FutureBuilder<List<dynamic>>(
        future: vehicles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final vehicleList = snapshot.data!;
            return ListView.builder(
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                final vehicle = vehicleList[index];
                return ListTile(
                  title: Text(vehicle["name"]),
                  subtitle: Text("Mileage: ${vehicle["mileage"]} km/l | Year: ${vehicle["year"]}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
