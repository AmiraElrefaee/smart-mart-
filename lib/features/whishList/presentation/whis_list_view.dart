import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/whishList/presentation/widgets/Whis_list_view_body.dart';

import 'managers/show_whish_list_cibit/show_whish_list_cubit.dart';

class WhisListView extends StatelessWidget {
  const WhisListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WhisListViewBody(),
    );
  }
}
