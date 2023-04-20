import 'package:flutter/material.dart';
import 'package:marvel/widgets/marvel_container.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer(
      {super.key, required this.name, required this.img, required this.onTap});

  final String? name;
  final String? img;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MarvelContainer(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(img ?? '',
                  height: 80,
                  width: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('No Image')),
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(name ?? '')),
          ],
        ),
      ),
    );
  }
}
