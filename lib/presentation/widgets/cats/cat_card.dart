import 'package:flutter/material.dart';
import '../../../domain/entities/cats/cat.dart';
import '../custom_network_image.dart';

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
                child: CustomNetworkImage(urlImage: cat.imageUrl),
              ),
              _textGradientBackground(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              _textGradientBackground(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _catInfoText(
                      text: cat.breedName,
                      textStyle: textStyles.titleLarge,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _catInfoText(
                          text: 'Origin: ${cat.origin}',
                          textStyle: textStyles.titleMedium,
                        ),
                        const Spacer(),
                        _catInfoText(
                          text: 'Intelligence: ${cat.intelligence}',
                          textStyle: textStyles.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textGradientBackground({
    required Alignment begin,
    required Alignment end,
  }) =>
      SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin,
              end: end,
              stops: const [0.8, 1.0],
              colors: const [Colors.transparent, Colors.black87],
            ),
          ),
        ),
      );

  Widget _catInfoText({required String text, required TextStyle? textStyle}) =>
      Text(text, style: textStyle?.copyWith(color: Colors.white));
}
