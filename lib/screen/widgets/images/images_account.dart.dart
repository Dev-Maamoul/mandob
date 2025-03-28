import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageAccount extends StatelessWidget {
  const ImageAccount({
    super.key,
    this.size = 80,
    this.url =
        "https://www.shutterstock.com/image-vector/eagle-logo-fierce-vibrant-soaring-260nw-2494369867.jpg",
  });
  final String? url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    // String defaultImage =
    //     "https://www.shutterstock.com/image-vector/eagle-logo-fierce-vibrant-soaring-260nw-2494369867.jpg";
    // if (url != null) {
    //   defaultImage = url!;
    // }
    return ClipRRect(
      borderRadius: BorderRadius.circular(size!),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        width: size!,
        height: size!,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        imageUrl: url!,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget:
            (context, url, error) => Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              width: size!,
              height: size!,
            ),
      ),
    );
  }
}
