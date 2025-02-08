import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
 
 final String baseUrl = "http://10.0.2.2:4000"; 



  final Logger logger = Logger(); 

  Future<List<dynamic>> fetchVehicles() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/vehicles"));
      logger.i("✅ Fetching from API: $baseUrl/vehicles");

      if (response.statusCode == 200) {
        logger.i("✅ API Response: ${response.body}"); // Log response
        return json.decode(response.body);
      } else {
        logger.e("❌ Failed to fetch vehicles: ${response.statusCode}", error: response.body);
        throw Exception('Failed to load vehicles');
      }
    } catch (e) {
      logger.e("❌ Error fetching vehicles", error: e);
      return []; 
    }
  }
}
