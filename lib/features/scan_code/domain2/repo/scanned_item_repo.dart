import 'package:smart_mart/features/scan_code/data/models/models_scanned_item.dart';

import '../entity/entity_scanned_item.dart';

abstract class  ScannedItemRepo {
  Stream <List<Product>> getProduct();
}