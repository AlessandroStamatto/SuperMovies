import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_movies/helpers/alerts.dart';
import 'package:super_movies/helpers/navi.dart';
import 'package:super_movies/models/Filme.dart';
import 'package:super_movies/services/FilmesService.dart';

import 'FilmePage.dart';
import 'LoginPage.dart';

class FavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder(
          future: FilmesService.getFavoritos(),
          builder: (context, snapshot) => _filmesList(snapshot.data)
      )
    );
  }

  _filmesList(List<Filme> filmes) {
    return Center(
      child: filmes != null
          ? ListView.builder(
              itemCount: min(20, filmes.length),
              itemBuilder: (ctx, idx) => _card(ctx, filmes[idx])
          )
          : Text('Carregando filmes...', style: TextStyle(fontSize: 26),),
    );
  }

  _card(BuildContext context, Filme filme) {
    final path = 'https://image.tmdb.org/t/p/w300';

    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.network(
                  path + filme.poster_path,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  color: Colors.black45,
                  child: Text(
                    filme.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                )
              ],
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('VER'),
                    onPressed: () => push(context, FilmePage(filme)),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}