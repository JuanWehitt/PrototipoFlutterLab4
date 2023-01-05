/*//     final ArtistModel = ArtistModelFromJson(jsonString);
import 'package:prototipo_flutter_lab4/model/artist_data.dart';
import 'dart:convert';

//String ArtistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
  static ArtistData fromJson(String str) =>
      ArtistData.fromJson(json.decode(str));
}*/

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class ArtistModel {
  static Artist fromJson(String str) => Artist.fromJson(json.decode(str));
}

class Artist {
  int code;
  String status;
  Data data;

  Artist({
    required this.code,
    required this.status,
    required this.data,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  ExternalUrls externalUrls;
  Followers followers;
  List<String> genres;
  String href;
  String id;
  List<Image> images;
  String name;
  int popularity;
  String type;
  String uri;

  Data({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );
}

class ExternalUrls {
  String spotify;

  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );
}

class Followers {
  dynamic href;
  int total;

  Followers({
    required this.href,
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );
}

class Image {
  int height;
  String url;
  int width;

  Image({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );
}
