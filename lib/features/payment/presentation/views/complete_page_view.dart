import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/coplete_page_view_body.dart';
import 'package:video_player/video_player.dart';

class CompletePageView extends StatefulWidget {
  const CompletePageView({super.key});

  @override
  State<CompletePageView> createState() => _CompletePageViewState();
}

class _CompletePageViewState extends State<CompletePageView> {


  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      CopletePageViewBody(),

    );
  }


}