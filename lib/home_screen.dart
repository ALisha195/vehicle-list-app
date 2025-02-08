import 'package:flutter/material.dart';
import 'package:logger/logger.dart'; // Import logger

import 'api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Logger logger = Logger(); // Create Logger instance
  late Future<List<dynamic>> _vehicles;

  @override
  void initState() {
    super.initState();
    _vehicles = ApiService().fetchVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle List")),
      body: FutureBuilder<List<dynamic>>(
        future: _vehicles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            logger.e("Error fetching data", error: snapshot.error);
            return Center(child: Text("Error fetching data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No vehicles available"));
          }

          final vehicles = snapshot.data!;
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              logger.i("Vehicle Loaded: ${vehicle['name']}");

              return ListTile(
                title: Text(vehicle['name']),
                subtitle: Text("Mileage: ${vehicle['mileage']} km/l | Year: ${vehicle['year']}"),
              );
            },
          );
        },
      ),
    );
  }
}
