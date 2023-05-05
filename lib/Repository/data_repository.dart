import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:noteflix/Models/movie.dart';
import 'package:noteflix/Services/api_service.dart';

//lien entre les appels api et les ui
class DataRepository with ChangeNotifier {
  final APIService apiService = APIService();
  final List<Movie> _popularMoviePageList = [];
  int _popularMoviePageIndex = 1;

//le getter qui permet de recuperer la list des films populaires
  List<Movie> get popularMovieList => _popularMoviePageList;
  //fonction pour recuperer les films populaires
  Future<void> getPopularMovies() async {
    try {
      //recupération de toutes les popularMovie
      List<Movie> movies =
          await apiService.getPopularMovies(pageNumber: _popularMoviePageIndex);
      //on les met dans la liste _popularMoviePageList
      _popularMoviePageList.addAll(movies);
      _popularMoviePageIndex++;
      notifyListeners();
      //comme nous connaissons la provenance de notre erreur on utulise on...catch()
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      //relancer l'erreur
      rethrow;
    }
  }
}
