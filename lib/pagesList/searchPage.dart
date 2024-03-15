import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../UtilitiesList/CustomNavigation.dart';
import '../pagesList/movieInfo.dart';

class searchPage extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _movies = [];

  Future<void> _searchMovies() async {
    String searchTerm = _searchController.text;
    String apiKey = '727f973efb2b9ac7d2270da521504769';
    String url = 'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$searchTerm';

    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> movies = json.decode(response.body)['results'];

    setState(() {
      _movies = movies;
    });
  }

  void _goTomovieInfo1(dynamic movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => movieInfo1(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 56, 13), // Set background color to dark green
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search,size: 25,color: Colors.yellow,),
                  onPressed: () {
                    _searchMovies();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> movie = _movies[index];
                return ListTile(
                  leading: Image.network(
                      'https://image.tmdb.org/t/p/w92${movie['poster_path']}'),
                  title: Text(movie['title']),
                  subtitle: Text(movie['release_date']),
                  onTap: () {
                    _goTomovieInfo1(movie);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigation(),
    );
  }
}
