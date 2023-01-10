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
  int total;
  int limit;
  int offset;

  Data({
    required this.href,
    required this.items,
    required this.total,
    required this.limit,
    required this.offset,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        href: json["href"],
        items: List<Album>.from(json["items"].map((x) => Album.fromJson(x))),
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
      );
}

class Album {
  List<ArtistAlbum> artists;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<AlbumImage> images;
  String name;
  DateTime releaseDate;
  int totalTracks;
  String uri;
  bool? explicit = false;

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
        artists: List<ArtistAlbum>.from(
            json["artists"].map((x) => ArtistAlbum.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<AlbumImage>.from(
            json["images"].map((x) => AlbumImage.fromJson(x))),
        name: json["name"],
        releaseDate: (json["release_date"].toString().length == 4)
            ? DateTime.parse(json["release_date"] + '-10-10')
            : DateTime.parse(json["release_date"]),
        totalTracks: json["total_tracks"],
        uri: json["uri"],
      );
}

class ArtistAlbum {
  String name;

  ArtistAlbum({
    required this.name,
  });

  factory ArtistAlbum.fromJson(Map<String, dynamic> json) => ArtistAlbum(
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

class AlbumImage {
  int height;
  String url;
  int width;

  AlbumImage({
    required this.height,
    required this.url,
    required this.width,
  });
  factory AlbumImage.fromJson(Map<String, dynamic> json) => AlbumImage(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );
}
