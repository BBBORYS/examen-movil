import 'package:flutter/material.dart';
import '../model/smartphone.dart';
import '../services/database_service.dart';

class AddSmartphoneScreen extends StatelessWidget {
  final DatabaseService dbService = DatabaseService();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController storageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Smartphone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: brandController,
              decoration: InputDecoration(labelText: 'Brand'),
            ),
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: storageController,
              decoration: InputDecoration(labelText: 'Storage'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (brandController.text.isNotEmpty &&
                    modelController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    storageController.text.isNotEmpty) {
                  Smartphone newSmartphone = Smartphone(
                    brand: brandController.text,
                    model: modelController.text,
                    price: int.parse(priceController.text),
                    storage: int.parse(storageController.text),
                  );
                  await dbService.addSmartphone(newSmartphone);
                  Navigator.pop(context);
                }
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
