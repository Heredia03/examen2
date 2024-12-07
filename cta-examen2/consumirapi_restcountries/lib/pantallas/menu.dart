import 'package:flutter/material.dart';
import 'consulta_codigo.dart';
import 'consulta_nombre.dart'; // Importa la pantalla de consulta por nombre

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla De Busqueda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsultaCodigoScreen()),
                );
              },
              child: Text('Consulta por Código'),
            ),
            SizedBox(height: 20), // Agrega un espacio entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsultaNombreScreen()), // Navega a la pantalla de consulta por nombre
                );
              },
              child: Text('Consulta por Nombre'),
            ),
          ],
        ),
      ),
    );
  }
}

