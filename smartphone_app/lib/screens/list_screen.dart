import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../model/smartphone.dart';

class ListScreen extends StatelessWidget {
  final DatabaseService dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de los registros de la BD'),
      ),
      body: StreamBuilder<List<Smartphone>>(
        stream: dbService.getSmartphones(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final smartphone = snapshot.data![index];
              return Dismissible(
                key: Key(smartphone.id!),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  dbService.deleteSmartphone(smartphone.id!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${smartphone.brand} eliminado')),
                  );
                },
                child: ListTile(
                  title: Text('${smartphone.brand} ${smartphone.model}'),
                  subtitle: Text('Price: \$${smartphone.price} - Storage: ${smartphone.storage}GB'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
