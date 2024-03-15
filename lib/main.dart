import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'pagesList/trendingWidget.dart';
import 'pagesList/topRatedWidget.dart';
import 'pagesList/popularTVWidget.dart';
import 'UtilitiesList/CustomNavigation.dart';
import 'package:go_router/go_router.dart';
import 'pagesList/upcomingWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.brown,
      ),
      routerConfig: _router,
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiKey = '50ebd02083c517a50823d415e3d3a798';
  final String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGViZDAyMDgzYzUxN2E1MDgyM2Q0MTVlM2QzYTc5OCIsInN1YiI6IjY1ZjA3NTg4MzI0ODliMDE2NDliZTFiOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PguBNHGpJdeG7Xq8pbxp22rodLewkQVx7ioqQ-U2dt8';

  List trendingMoviesList = [];
  List topRatedMoviesList = [];
  List popularTvShowsList = [];
  List upcomingMoviesList = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    TMDB tmdb = TMDB(
      ApiKeys(
        apiKey,
        readAccessToken,
      ),
    );

    Map trending = await tmdb.v3.trending.getTrending();
    Map topRated = await tmdb.v3.movies.getTopRated();
    Map tvShows = await tmdb.v3.tv.getPopular();
    Map upcoming = await tmdb.v3.movies.getUpcoming();

    setState(() {
      trendingMoviesList = trending['results'];
      topRatedMoviesList = topRated['results'];
      popularTvShowsList = tvShows['results'];
      upcomingMoviesList = upcoming['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Set the background color to green
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(249, 0, 0, 0),
        title: Text(
          "Movie Buster",
          style: TextStyle(color: Colors.yellow, fontSize: 40),
        ),
      ),
      body: ListView(
        children: [
          upcomingMovies(Upcoming: upcomingMoviesList),
          trendingMovies(trending: trendingMoviesList,),
          topRatedMovies(topRated: topRatedMoviesList,),
          popularTvShows(popularTvShow: popularTvShowsList,),
        ],
      ),
      bottomNavigationBar: CustomNavigation(),
    );
  }
}
