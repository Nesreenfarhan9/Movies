import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/shared/app_theme.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List movies = [];

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;
    final url = Uri.parse('https://yts.mx/api/v2/list_movies.json?query_term=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        movies = data['data']['movies'] ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 21, right: 21),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: AppTheme.gray, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ImageIcon(
                    AssetImage(
                      'assets/icons/search.png',
                    ),
                    color: AppTheme.primary),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: searchMovies,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: AppTheme.primary,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: AppTheme.primary),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: movies.isEmpty
              ? Center(
                  child: Image.asset("assets/images/image.png",
                      width: 140, height: 150),
                )
              : ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return ListTile(
                      leading: Image.network(movie['medium_cover_image']),
                      title: Text(movie['title'], style: TextStyle(color: Colors.white)),
                      subtitle: Text("Year: ${movie['year']}", style: TextStyle(color: Colors.white70)),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

