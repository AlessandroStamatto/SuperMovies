import 'package:flutter/material.dart';
import 'package:super_movies/helpers/alerts.dart';
import 'package:super_movies/helpers/navi.dart';

import 'FilmesPage.dart';
import 'LoginPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Filmes"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Filmes",
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: "Meus Favoritos",
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FilmesPage(),
            FilmesPage(),
          ],
        ),
      ),
    );
  }
}
