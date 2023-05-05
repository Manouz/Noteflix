import 'package:noteflix/Models/movie.dart';
import 'package:noteflix/Services/api.dart';
import 'package:dio/dio.dart';

class APIService {
  final API api = API();
  //création de dio
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    //Construire l'url qu'on va appeler
    //le path c'est le chemain qu'on va lui apsser en paramètre soit movie/{id movie}
    String _url = api.baseUrl + path;

    //Cstrction des paramètres de la requette
    Map<String, dynamic> query = {
      'api_key': api.apikey,
      'language': "fr-FR",
    };

    ///si params n'est pas null on ajoute son contenu à query
    if (params != null) {
      query.addAll(params);
    }
    //on fait l'appel
    final response = await dio.get(_url, queryParameters: query);

    //on voit ensuite si la requete s'est bien passé
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  //Recuperer les films populaires
  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {
    // on fait notre appel
    Response response = await getData('/movie/popular', params: {
      //on vient de spécifier un paramètre supplémentaire
      'page': pageNumber
    });

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data['results'];
      List<Movie> movies = [];
      //on fait une boucle sur tout nos elements results
      for (Map<String, dynamic> json in results) {
        //pour chaque elmts on va creer un movie
        //on va convertir en movie
        //on rée un objet de type Movie
        Movie movie = Movie.fromJson(json);
        //on va ajoutertoutes les informations dans la list movies
        //on alimente notre liste movies
        movies.add(movie);
      }
      return movies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getGenres() async {
    Response response = await getData('/genre/movie/list');
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> genre = data['genres'];
      List<Movie> movies = [];
      //on fait une boucle sur tout nos elements results
      for (Map<String, dynamic> json in genre) {
        //pour chaque elmts on va creer un movie
        //on va convertir en movie
        //on rée un objet de type Movie
        Movie movie = Movie.fromJson(json);
        //on va ajoutertoutes les informations dans la list movies
        //on alimente notre liste movies
        movies.add(movie);
      }
      return movies;
    } else {
      throw response;
    }
  }
}
