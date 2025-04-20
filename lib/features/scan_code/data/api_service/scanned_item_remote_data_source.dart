import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain2/entity/entity_scanned_item.dart';
import '../models/models_scanned_item.dart';

abstract class ScannedItemRemoteDataSource {
  Stream<List<Product>> getProducts();
}



class  ScannedItemRemoteDataSourceImple implements ScannedItemRemoteDataSource{
  @override
final FirebaseFirestore firebaseFirestore;

  ScannedItemRemoteDataSourceImple(this.firebaseFirestore);

  Stream<List<Product>> getProducts() {
  return firebaseFirestore.collection('snakes').snapshots().map(
      (snapShot){
        return snapShot.docs.map(
        (doc)=>ProductModel.fromFirestore(doc.data(),doc.id),
        ).toList();
      }

  );

  }

}