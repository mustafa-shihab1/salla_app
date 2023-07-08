import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  double boxHeight;
  ShimmerBox({
    super.key,
    required this.boxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: boxHeight,
      child: Shimmer.fromColors(
        baseColor: ManagerColors.white,
        highlightColor: ManagerColors.lightGrey,
        child: Container(
          width: double.infinity,
          color: ManagerColors.grey,
        ),
      ),
    );
  }
}
