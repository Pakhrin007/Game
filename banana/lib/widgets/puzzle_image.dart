import 'package:flutter/material.dart';

class PuzzleImage extends StatelessWidget {
  final String url;

  const PuzzleImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: 250,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Text("Image failed to load"),
    );
  }
}
