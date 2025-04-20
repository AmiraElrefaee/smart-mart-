import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section-title_app_bar.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_draggle_total_num.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_show_scanned_item.dart';

import '../../../data/repo_imple/repo_imple_sacnned_item.dart';
import '../../managers/cubit_scanned_item/scanned_item_cubit.dart';

class MyDraggableSheet extends StatefulWidget {
  const MyDraggableSheet({super.key, required this.cameraController});

  final MobileScannerController cameraController;

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final DraggableScrollableController _controller = DraggableScrollableController();
  final double _maxChildSize = 0.3;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (_controller.size >= _maxChildSize * 0.8) {
                _openBottomSheet(context);
              }
            }
            return true;
          },
          child: DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: 0.18,
            minChildSize: 0.18,
            maxChildSize: _maxChildSize,
            snap: true,
            snapSizes: const [0.18, 0.3],
            builder: (context, scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: CustomLine(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SectionDraggleTotalNum(),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) =>ScannedItemCubit(getIt<ScannedItemRepoImple>())..fetchProduct(),
          child: SectionShowScannedItem(
            cameraController: widget.cameraController,
          ),
        );
      },
    );
  }
}