import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String urlImage;

  const CustomNetworkImage({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
        return child;
      },
    );
  }
}
