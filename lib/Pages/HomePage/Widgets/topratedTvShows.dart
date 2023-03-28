import 'package:flutter/material.dart';
import 'package:movie_recommender_application/Utils/text.dart';

import '../../Description/description.dart';

class TopratedTvShows extends StatelessWidget {
  const TopratedTvShows({super.key, required this.topratedTvShows});
  final List topratedTvShows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: "Treding Movies",
          size: 25.0,
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topratedTvShows.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionDisplayer(
                        name: topratedTvShows[index]["name"],
                        bannerurl: 'https://image.tmdb.org/t/p/w500' +
                            topratedTvShows[index]["backdrop_path"],
                        posterurl: 'https://image.tmdb.org/t/p/w500' +
                            topratedTvShows[index]["poster_path"],
                        description: topratedTvShows[index]["overview"],
                        ratings: topratedTvShows[index]["vote_average"],
                        relesedate: topratedTvShows[index]["release_date"],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  child: Column(children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  topratedTvShows[index]["poster_path"]),
                        ),
                      ),
                    ),
                    Container(
                      child: modified_text(
                          text: topratedTvShows[index]["name"] != null
                              ? topratedTvShows[index]["name"]
                              : "Loading.."),
                    )
                  ]),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
