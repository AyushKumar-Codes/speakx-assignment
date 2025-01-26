// widgets/shimmer_placeholder.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        10, // Show 10 shimmer placeholders
            (index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                color: Colors.grey[300],
              ),
              title: Container(
                width: double.infinity,
                height: 10,
                color: Colors.grey[300],
              ),
              subtitle: Container(
                width: double.infinity,
                height: 10,
                color: Colors.grey[300],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
