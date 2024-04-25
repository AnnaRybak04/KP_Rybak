import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:shimmer/shimmer.dart';

class OneShimmer extends StatelessWidget {
  const OneShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: PaddingConstants.extraImmense,
      width: PaddingConstants.extraImmense,
      child: Shimmer.fromColors(
        baseColor: theme.colorScheme.primary.withOpacity(0.5),
        highlightColor: theme.colorScheme.secondary.withOpacity(0.5),
        child: Container(
          color: theme.colorScheme.background,
        ),
      ),
    );
  }
}
