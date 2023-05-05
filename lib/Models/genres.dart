// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:noteflix/Services/api.dart';

// class Genre {
//   final int id;
//   final String name;

//   Genre({
//     required this.id,
//     required this.name,
//   });

//   Genre copyWith({
//     int? id,
//     String? name,
//     String? description,
//     String? posterPath,
//   }) {
//     return Genre(
//       id: id ?? this.id,
//       name: name ?? this.name,
//     );
//   }

// //il crée  un objet de type Movie
//   factory Genre.fromJson(Map<String, dynamic> map) {
//     return Genre(
//       id: map['id'],
//       name: map['title'],
//     );
//   }

//   String posterUrl() {
//     API api = API();
//     return api.baseImageUrl + posterPath!;
//   }
// }
