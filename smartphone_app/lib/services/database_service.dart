import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/smartphone.dart';

class DatabaseService {
  final CollectionReference smartphoneCollection = FirebaseFirestore.instance.collection('smartphones');

  Future<void> addSmartphone(Smartphone smartphone) async {
    DocumentReference docRef = await smartphoneCollection.add(smartphone.toMap());
    smartphone.id = docRef.id;
  }

  Future<void> deleteSmartphone(String id) async {
    await smartphoneCollection.doc(id).delete();
  }

  Stream<List<Smartphone>> getSmartphones() {
    return smartphoneCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Smartphone.fromMap(doc.data() as Map<String, dynamic>, id: doc.id);
      }).toList();
    });
  }
}
