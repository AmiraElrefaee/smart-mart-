import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/details_page_view_body.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key, required this.item});
final ItemModel item ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: DetailsPageViewBody(
        item: item,
      ),
    );
  }
}
