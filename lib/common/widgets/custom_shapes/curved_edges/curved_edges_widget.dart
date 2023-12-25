import 'package:e_book_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCurvedWidget extends StatelessWidget {
  final Widget? child;
  const CustomCurvedWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
