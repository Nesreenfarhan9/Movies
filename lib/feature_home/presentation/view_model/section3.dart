import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class Section3 extends StatelessWidget {
  final String summary;
  final List<Map<String, String>> cast;
  final List<String> genres;

  const Section3({
    Key? key,
    required this.summary,
    required this.cast,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Summary', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(summary, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            Text('Cast', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cast.length,
              itemBuilder: (context, index) {
                final actor = cast[index];
                return Card(
                  color: AppTheme.gray,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: actor['image']!.startsWith('assets/')
                              ? AssetImage(actor['image']!) as ImageProvider
                              : NetworkImage(actor['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      'Name: ${actor['name']!}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      'Character: ${actor['character']!}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            Text('Genres', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: genres.map((genre) {
                return Chip(
                  label: Text(genre, style: Theme.of(context).textTheme.titleSmall),
                  backgroundColor: AppTheme.gray,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
