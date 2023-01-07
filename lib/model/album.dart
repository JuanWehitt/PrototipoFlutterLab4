// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

class AlbumModel {
  static AlbumData fromJson(String str) => AlbumData.fromJson(json.decode(str));
}

class AlbumData {
  int code;
  String status;
  Data data;

  AlbumData({
    required this.code,
    required this.status,
    required this.data,
  });

  factory AlbumData.fromJson(Map<String, dynamic> json) => AlbumData(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String href;
  List<Album> items;

  Data({
    required this.href,
    required this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        href: json["href"],
        items: List<Album>.from(json["items"].map((x) => Album.fromJson(x))),
      );
}

class Album {
  List<Artist> artists;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  DateTime releaseDate;
  int totalTracks;
  String uri;

  Album({
    required this.artists,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.totalTracks,
    required this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        totalTracks: json["total_tracks"],
        uri: json["uri"],
      );
}

class Artist {
  String name;

  Artist({
    required this.name,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
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
