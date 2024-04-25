import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';

class OneNotFound extends StatelessWidget {
  const OneNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.search_off,
          size: 100,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: PaddingConstants.medium),
        Text(
          'Нічого не знайдено',
          style: theme.textTheme.titleLarge,
        ),
      ],
    );
  }
}
