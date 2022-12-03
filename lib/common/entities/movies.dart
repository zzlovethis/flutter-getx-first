class MoviesEntity {

  List<Movie>? movies;

  MoviesEntity({this.movies});

  // factory MoviesEntity.fromJson(Map<String,dynamic> json) {
  //
  //   List<Movie> moviesList =
  //   json.map((value) => .fromJson(value)).toList();
  //
  //   return MemberList(memberList: memberList);
  // }
  factory MoviesEntity.fromJson(Map<String, dynamic> json) {
    final originList = json['movies'] as List;
    List<Movie> movieList =
    originList.map((value) => Movie.fromJson(value)).toList();
    // return ClassInfo(
    //     id: json['id'], name: json['class_name'], studentList: studentList);
    return MoviesEntity(movies: movieList);
  }
  // MoviesEntity.fromJson(Map<String, dynamic> json) {
  //   if (json['movies'] != null) {
  //     movies = <Movie>[];
  //     json['movies'].forEach((v) {
  //       movies!.add(Movie.fromJson(v));
  //     });
  //
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  int? id;
  String? title;
  int? year;
  String? runtime;
  List<String>? genres;
  int? version;

  Movie(
      {this.id,
        this.title,
        this.year,
        this.runtime,
        this.genres,
        this.version});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    runtime = json['runtime'];
    //genres = json['genres'].cast<String>();
    var originList = json['genres'];
    genres = new List<String>.from(originList);
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['runtime'] = this.runtime;
    data['genres'] = this.genres;
    data['version'] = this.version;
    return data;
  }
}


// class MoviesEntity {
//   List<Movies>? movies;
//
//   MoviesEntity({this.movies});
//
//   MoviesEntity.fromJson(Map<String, dynamic> json) {
//     if (json['movies'] != null) {
//       movies = <Movies>[];
//       json['movies'].forEach((v) {
//         movies!.add(Movies.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.movies != null) {
//       data['movies'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Movies {
//   int? id;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//   int? version;
//
//   Movies(
//       {this.id,
//         this.title,
//         this.year,
//         this.runtime,
//         this.genres,
//         this.version});
//
//   Movies.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     year = json['year'];
//     runtime = json['runtime'];
//     //genres = json['genres'].cast<String>();
//     var originList = json['genres'];
//     genres = new List<String>.from(originList);
//     version = json['version'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['year'] = this.year;
//     data['runtime'] = this.runtime;
//     data['genres'] = this.genres;
//     data['version'] = this.version;
//     return data;
//   }
// }




// class MoviesEntity {
//   //dynamic moive;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//
//   //var movie;
//
//   MoviesEntity({
//     //this.movie,
//     this.title,
//     this.year,
//     this.runtime,
//     this.genres,
//   });
//
//   factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
//       MoviesEntity(
//         //movie: json["movie"],
//         title: json["title"],
//         year: json["year"],
//         runtime: json["runtime"],
//         genres: json["genres"],
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         //"movie":moive,
//         "title": title,
//         "year": year,
//         "runtime": runtime,
//         "genres": genres,
//       };
// }


// class MoviesEntity {
//
//   List<Movie>? movies;
//
//   MoviesEntity({this.movies});
//
//   // factory MoviesEntity.fromJson(<dynamic> json) {
//   //
//   //   List<Movie> moviesList =
//   //   json.map((value) => .fromJson(value)).toList();
//   //
//   //   return MemberList(memberList: memberList);
//   // }
//
//   MoviesEntity.fromJson(Map<String, dynamic> json) {
//     if (json['movies'] != null) {
//       movies = <Movie>[];
//       json['movies'].forEach((v) {
//         movies!.add(Movie.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.movies != null) {
//       data['movies'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Movie {
//   int? id;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//   int? version;
//
//   Movie(
//       {this.id,
//         this.title,
//         this.year,
//         this.runtime,
//         this.genres,
//         this.version});
//
//   Movie.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     year = json['year'];
//     runtime = json['runtime'];
//     //genres = json['genres'].cast<String>();
//     //var originList = json['genres'];
//     genres = new List<String>.from(json['genres']);
//     version = json['version'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['year'] = this.year;
//     data['runtime'] = this.runtime;
//     data['genres'] = this.genres;
//     data['version'] = this.version;
//     return data;
//   }
// }




// class MoviesEntity {
//   //dynamic moive;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//
//   //var movie;
//
//   MoviesEntity({
//     //this.movie,
//     this.title,
//     this.year,
//     this.runtime,
//     this.genres,
//   });
//
//   factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
//       MoviesEntity(
//         //movie: json["movie"],
//         title: json["title"],
//         year: json["year"],
//         runtime: json["runtime"],
//         genres: json["genres"],
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         //"movie":moive,
//         "title": title,
//         "year": year,
//         "runtime": runtime,
//         "genres": genres,
//       };
// }



// class MoviesEntity {
//   List<Movies>? movies;
//
//   MoviesEntity({this.movies});
//
//   MoviesEntity.fromJson(Map<String, dynamic> json) {
//     if (json['movies'] != null) {
//       movies = <Movies>[];
//       json['movies'].forEach((v) {
//         movies!.add(Movies.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.movies != null) {
//       data['movies'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Movies {
//   int? id;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//   int? version;
//
//   Movies(
//       {this.id,
//         this.title,
//         this.year,
//         this.runtime,
//         this.genres,
//         this.version});
//
//   Movies.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     year = json['year'];
//     runtime = json['runtime'];
//     genres = json['genres'].cast<String>();
//     version = json['version'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['year'] = this.year;
//     data['runtime'] = this.runtime;
//     data['genres'] = this.genres;
//     data['version'] = this.version;
//     return data;
//   }
// }



//
// class MoviesEntity {
//
//   dynamic movies;
//
//
//   //var movie;
//
//   MoviesEntity({this.movies});
//
//   factory MoviesEntity.fromJson(Map<String, dynamic> json) => MoviesEntity(movies: json['movies']);
//
//   Map<String, dynamic> toJson() =>
//       {
//         'movies':movies,
//         // "title": title,
//         // "year": year,
//         // "runtime": runtime,
//         // "genres": genres,
//       };
// }
//
// // class MoviesEntity {
// //   //dynamic moive;
// //   String? title;
// //   int? year;
// //   String? runtime;
// //   List<String>? genres;
// //
// //   //var movie;
// //
// //   MoviesEntity({
// //     //this.movie,
// //     this.title,
// //     this.year,
// //     this.runtime,
// //     this.genres,
// //   });
// //
// //   factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
// //       MoviesEntity(
// //         //movie: json["movie"],
// //         title: json["title"],
// //         year: json["year"],
// //         runtime: json["runtime"],
// //         genres: json["genres"],
// //       );
// //
// //   Map<String, dynamic> toJson() =>
// //       {
// //         //"movie":moive,
// //         "title": title,
// //         "year": year,
// //         "runtime": runtime,
// //         "genres": genres,
// //       };
// // }
//
// // class MoviesEntity {
// //   dynamic movie,
// //
// //   MoviesEntity({
// //     this.movie,
// //   });
// //
// //   factory MoviesEntity.fromJson(Map<String, dynamic> json) => MoviesEntity(movie: json["movie"],
// //         // year: json["year"],
// //         // runtime: json["runtime"],
// //         // genres: json["genres"],);
// //
// //   Map<String, dynamic> toJson() =>
// //       {
// //         "movie": movie,
// //         // "year": year,
// //         // "runtime": runtime,
// //         // "genres": genres,
// //       };
// // }


// class MoviesEntity {
//
//   List<Movie>? movies;
//
//   MoviesEntity({this.movies});
//
//   // factory MoviesEntity.fromJson(Map<String,dynamic> json) {
//   //
//   //   List<Movie> moviesList =
//   //   json.map((value) => .fromJson(value)).toList();
//   //
//   //   return MemberList(memberList: memberList);
//   // }
//   factory MoviesEntity.fromJson(Map<String, dynamic> json) {
//     final originList = json['movies'] as List;
//     List<Movie> movieList =
//     originList.map((value) => Movie.fromJson(value)).toList();
//     // return ClassInfo(
//     //     id: json['id'], name: json['class_name'], studentList: studentList);
//     return MoviesEntity(movies: movieList);
//   }
//   // MoviesEntity.fromJson(Map<String, dynamic> json) {
//   //   if (json['movies'] != null) {
//   //     movies = <Movie>[];
//   //     json['movies'].forEach((v) {
//   //       movies!.add(Movie.fromJson(v));
//   //     });
//   //
//   //   }
//   // }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.movies != null) {
//       data['movies'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Movie {
//   int? id;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//   int? version;
//
//   Movie(
//       {this.id,
//         this.title,
//         this.year,
//         this.runtime,
//         this.genres,
//         this.version});
//
//   Movie.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     year = json['year'];
//     runtime = json['runtime'];
//     //genres = json['genres'].cast<String>();
//     //var originList = json['genres'];
//     genres = new List<String>.from(json['genres']);
//     version = json['version'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['year'] = this.year;
//     data['runtime'] = this.runtime;
//     data['genres'] = this.genres;
//     data['version'] = this.version;
//     return data;
//   }
// }


// class MoviesEntity {
//   List<Movies>? movies;
//
//   MoviesEntity({this.movies});
//
//   MoviesEntity.fromJson(Map<String, dynamic> json) {
//     if (json['movies'] != null) {
//       movies = <Movies>[];
//       json['movies'].forEach((v) {
//         movies!.add(Movies.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.movies != null) {
//       data['movies'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Movies {
//   int? id;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//   int? version;
//
//   Movies(
//       {this.id,
//         this.title,
//         this.year,
//         this.runtime,
//         this.genres,
//         this.version});
//
//   Movies.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     year = json['year'];
//     runtime = json['runtime'];
//     //genres = json['genres'].cast<String>();
//     var originList = json['genres'];
//     genres = new List<String>.from(originList);
//     version = json['version'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['year'] = this.year;
//     data['runtime'] = this.runtime;
//     data['genres'] = this.genres;
//     data['version'] = this.version;
//     return data;
//   }
// }




// class MoviesEntity {
//   //dynamic moive;
//   String? title;
//   int? year;
//   String? runtime;
//   List<String>? genres;
//
//   //var movie;
//
//   MoviesEntity({
//     //this.movie,
//     this.title,
//     this.year,
//     this.runtime,
//     this.genres,
//   });
//
//   factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
//       MoviesEntity(
//         //movie: json["movie"],
//         title: json["title"],
//         year: json["year"],
//         runtime: json["runtime"],
//         genres: json["genres"],
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         //"movie":moive,
//         "title": title,
//         "year": year,
//         "runtime": runtime,
//         "genres": genres,
//       };
// }