import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/ciudad.dart';

class ApiService {
  Future<CountryModel?> fetchCountryByName(String name) async {
    final url = Uri.parse('https://restcountries.com/v3.1/name/$name');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CountryModel.fromJson(data[0]);
    } else {
      throw Exception('Error al obtener los datos');
    }
  }

  Future<CountryModel?> fetchCountryByCode(String code) async {
    final url = Uri.parse('https://restcountries.com/v3.1/alpha/$code');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CountryModel.fromJson(data[0]);
    } else {
      throw Exception('Error al obtener los datos');
    }
  }
}
