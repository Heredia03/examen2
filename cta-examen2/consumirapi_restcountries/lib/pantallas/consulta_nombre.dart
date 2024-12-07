import 'package:flutter/material.dart';
import '../servicios/api_service.dart';
import '../modelos/ciudad.dart';

class ConsultaNombreScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final TextEditingController _controller = TextEditingController();

  ConsultaNombreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta por Nombre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Ingrese el nombre del país'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final country = await apiService.fetchCountryByName(_controller.text);
                  if (country != null) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(country.name),
                        content: Text(
                          'Código: ${country.code}\nCapital: ${country.capital}\nRegión: ${country.region}\nPoblación: ${country.population}',
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },
              child: const Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
