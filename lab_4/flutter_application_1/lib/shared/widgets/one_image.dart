import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/one_shimmer.dart';

class OneImage extends StatelessWidget {
  const OneImage({
    super.key,
    this.imageLink,
    required this.radius,
    this.aspectRatio = 1,
    this.iconSize = 20,
    this.image,
    this.imageAsset,
  });
  final String? imageLink;
  final BorderRadius radius;
  final double aspectRatio;
  final double iconSize;
  final Image? image;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          border: Border.all(color: theme.colorScheme.surfaceVariant),
          borderRadius: radius,
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: _buildImageWidget(context),
        ),
      ),
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    if (imageAsset != null) {
      return FittedBox(
        fit: BoxFit.cover,
        child: Image.asset(imageAsset!),
      );
    } else if (imageLink != null && image == null) {
      return _buildNetworkImage(context);
    } else if (imageLink == null && image != null) {
      return FittedBox(fit: BoxFit.cover, child: image);
    } else {
      return const Center(child: Icon(Icons.info));
    }
  }

  Widget _buildNetworkImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink!,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return const OneShimmer();
      },
      errorWidget: (context, url, error) {
        return const Center(child: Icon(Icons.info));
      },
      fit: BoxFit.cover,
    );
  }
}
