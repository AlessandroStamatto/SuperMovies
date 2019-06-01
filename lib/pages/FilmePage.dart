import 'package:flutter/material.dart';
import 'package:super_movies/helpers/alerts.dart';
import 'package:super_movies/helpers/navi.dart';
import 'package:super_movies/models/Filme.dart';
import 'package:super_movies/pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FilmePage extends StatelessWidget {
  final Filme filme;

  FilmePage(final Filme filme): filme = filme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(22),
          child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    final path = 'https://image.tmdb.org/t/p/w300';

    Firestore.instance.collection('favoritos').document()
        .setData({
          'title': 'teste', 'poster_path': 'caminho',
          'vote_average': '80', 'overview': 'sinopse'
        });

    return Column(
      children: <Widget>[
        Center(
          child: Text(this.filme.title,
            style: TextStyle(
              fontSize: 26,
              color: Colors.blue,
            )
          ),
        ),
        SizedBox(height: 20,),
        Container(
          height: 300,
          child: Image.network(
            path + filme.poster_path,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: 20,),
        Text(filme.overview,
            style: TextStyle(fontSize: 18, color: Colors.black87),
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
        ),
        SizedBox(height: 10,),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.favorite,
            color: Colors.black26,
            size: 46
          ),
        )
      ],
    );
  }
}
