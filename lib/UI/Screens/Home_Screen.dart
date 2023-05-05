import 'package:flutter/material.dart';
import 'package:noteflix/Models/movie.dart';
import 'package:noteflix/Repository/data_repository.dart';
//import 'package:noteflix/Services/api_service.dart';
import 'package:noteflix/Utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  //List<Movie>? movies;
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    //je cree une instance de mon provider de mon data repository
    final dataProvider = Provider.of<DataRepository>(context , listen:false);
    //on appele la fonction getPopularMovies de DataRepository
    await dataProvider.getPopularMovies();

    // value contient le resultat de la fonction getPopularMovies de notre classe APIService.Cette fonction retourne une liste de films populaires
    // APIService().getPopularMovies(pageNumber: 1).then((movielist) {
    //   setState(() {
    //     movies = movielist;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);

    return Scaffold(
        backgroundColor: noir,
        appBar: AppBar(
          backgroundColor: noir,
          leading: Image.asset("assets/images/netflix_logo_2.png"),
        ),
        body: ListView(
          children: [
            Container(
              height: 500,
              color: Colors.red,
                      child: Center(child: Text("lol")),

              // child:
              //  dataProvider.popularMovieList.isEmpty
              //     ? const Center()
              //     : Image.network(
              //         dataProvider.popularMovieList[7].posterUrl(),
              //         fit: BoxFit.cover,
              //       ),
            ),
            Text('Tendance Actuelle',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 19)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 11,
                  itemBuilder: ((BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 9),
                      width: 100,
                      color: Colors.blueAccent,
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 19),
            Text('Actuellement au cinéma',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 19)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 11,
                  itemBuilder: ((BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 9),
                      width: 200,
                      color: Colors.blueAccent,
                      child: Center(child: Text(index.toString())),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 19),
            Text('Ils arrivent bientôt',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 19)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 11,
                  itemBuilder: ((BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 9),
                      width: 160,

                      ///height: 70,
                      color: Colors.blueAccent,
                      child: Center(child: Text(index.toString())),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 19),
            Text('Les genres des films',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 19)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 11,
                  itemBuilder: ((BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 9),
                      width: 160,

                      ///height: 70,
                      color: Colors.blueAccent,
                      child: Center(child: Text(index.toString())),
                    );
                  }),
                ),
              ),
            )
          ],
        ));
  }
}
