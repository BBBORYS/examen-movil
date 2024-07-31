import 'package:flutter/material.dart';
import '../model/smartphone.dart';

class DetailScreen extends StatelessWidget {
  final Smartphone smartphone;

  DetailScreen({required this.smartphone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta individual de un registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Brand: ${smartphone.brand}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Model: ${smartphone.model}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Price: \$${smartphone.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Storage: ${smartphone.storage}GB', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Regresar'),
        ),
      ),
    );
  }
}
