import 'package:flutter/material.dart';
import 'package:movie_recommender_application/Pages/HomePage/Widgets/topratedTvShows.dart';
import 'package:movie_recommender_application/Pages/HomePage/Widgets/upComingMovies.dart';
import 'package:movie_recommender_application/Utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'Widgets/tredndingMovies.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _apiKey = "3e9067c6e8739bbb704251a454d830db";
  final _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZTkwNjdjNmU4NzM5YmJiNzA0MjUxYTQ1NGQ4MzBkYiIsInN1YiI6IjY0MjI4ODYyMDhjZjg3MDA3ZjM5NGUzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Faqp3l0XtdizpR-fSU7AR8wLe6_QJ7Q6rpzGh293YY";

  List trendingMovies = [];
  List upComingMovies = [];
  List topratedTvShows = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(_apiKey, _accessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingMoviesResult =
        await tmdbWithCustomLogs.v3.trending.getTrending();

    Map upComingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    Map topratedTvShowsResult = await tmdbWithCustomLogs.v3.tv.getTopRated();

    //print(trendingResult);
    setState(() {
      trendingMovies = trendingMoviesResult["results"];
      upComingMovies = upComingResult["results"];
      topratedTvShows = topratedTvShowsResult["results"];
    });
    //print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: "Movie Recommender ❤",
        ),
      ),
      body: ListView(
        children: [
          UpComingMovies(
            upComingMovies: upComingMovies,
          ),
          TrendingMovies(
            trendingMovies: trendingMovies,
          ),
          TopratedTvShows(topratedTvShows: topratedTvShows),
        ],
      ),
    );
  }
}
