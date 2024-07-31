import 'package:flutter/material.dart';
import '../model/smartphone.dart';

class SmartphoneWidget extends StatelessWidget {
  final Smartphone smartphone;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  SmartphoneWidget({required this.smartphone, required this.onDelete, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${smartphone.brand} ${smartphone.model}'),
      subtitle: Text('Price: \$${smartphone.price} - Storage: ${smartphone.storage}GB'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
      onTap: onTap,
    );
  }
}
