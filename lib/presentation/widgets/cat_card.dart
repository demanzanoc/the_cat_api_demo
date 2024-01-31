import 'package:flutter/material.dart';
import '../../domain/entities/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      height: 300,
      margin: const EdgeInsets.all(14),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.network(
                  cat.imageUrl,
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
                ),
              ),
              const SizedBox.expand(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.8, 1.0],
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ),
              const SizedBox.expand(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.8, 1.0],
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 10,
                child: Text(
                  'Origin: ${cat.origin}',
                  style: textStyles.titleMedium!.copyWith(color: Colors.white),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 10,
                child: Text(
                  'Intelligence: ${cat.intelligence}',
                  style: textStyles.titleMedium!.copyWith(color: Colors.white),
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Text(
                  cat.breedName,
                  style: textStyles.titleLarge!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
