import 'package:flutter/material.dart';
import '../servicios/api_service.dart';
import '../modelos/ciudad.dart';

class ConsultaCodigoScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta por Código')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingrese el código del país'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  final country = await apiService.fetchCountryByCode(_controller.text.trim());
                  if (country != null) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(country.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Código: ${country.code}'),
                            Text('Capital: ${country.capital}'),
                            Text('Región: ${country.region}'),
                            Text('Población: ${country.population}'),
                            SizedBox(height: 10),
                            Image.network(country.flag, height: 50),
                          ],
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
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
