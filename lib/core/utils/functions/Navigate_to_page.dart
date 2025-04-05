import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

Timer?_debounce;

void navigateToPage(  String Loaction,BuildContext context) {
  // if ( _debounce?.isActive ?? false) return;
  // if (GoRouter.of(context).location != Loaction) {
  //
  // }
  // GoRouter.of(context).go(Loaction);

  _debounce = Timer(Duration(milliseconds: 500), () {
    GoRouter.of(context).push(Loaction);

  });
}