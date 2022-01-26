import 'package:flutter/material.dart';
import 'package:movie_app/widgets/topRatedMovies.dart';
import 'package:movie_app/widgets/trendingMovies.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  String apiKey = 'a7a1c048477195cf9915217c4ac6b375';
  final readAccessTocken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2ExYzA0ODQ3NzE5NWNmOTkxNTIxN2M0YWM2YjM3NSIsInN1YiI6IjYxZTE1MDMwZDhlMjI1MDA5ODQwODFjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.crOSRIOLha0G17uzX2GLVt6Br6HOrM83tnedPqSSs7I';

  loadMovies() async {
    TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apiKey, readAccessTocken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbwithCustomLogs.v3.tv.getPouplar();
    // print(trendingResult);
    // print(topRatedResult);
    // print('--------------------------------------------');
    //
    // print(tvResult);
    // print('--------------------------------------------');

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    // print('--------------------------------------------');
    // print(trendingMovies);
    // print('--------------------------------------------');
    print(topRatedMovies);
    print('--------------------------------------------');
    print(tv);
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie App 💖'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingMovies,
            ),
            TopRatedMovies(
              topRated: topRatedMovies,
            ),
            TV(
              tv: tv,
            ),
          ],
        ));
  }
}
