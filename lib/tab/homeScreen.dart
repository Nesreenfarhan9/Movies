import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movie_provider.dart';
import 'movie_item.dart';
import 'movie_details_screen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(movieProvider);
    final selectedImage = ref.watch(selectedImageProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(selectedImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Center(
                        child: Image(
                            image:
                                AssetImage('assets/images/available_now.png'),
                            height: 50),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            viewportFraction: 0.3,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              ref.read(selectedImageProvider.notifier).state =
                                  movies[index].image;
                            },
                          ),
                          items: movies.map((movie) {
                            return GestureDetector(
                              onTap: () => navigateToDetails(context),
                              child: MovieItem(
                                movie: movie,
                                onTap: () => navigateToDetails(context),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Image(
                  image: AssetImage('assets/images/watch_now.png'), height: 50),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailsScreen()),
    );
  }
}
