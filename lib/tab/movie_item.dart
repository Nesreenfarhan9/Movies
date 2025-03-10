import 'package:flutter/material.dart';
import 'movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  MovieItem({required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
                width: 100,
                height: 150,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      movie.rating,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
