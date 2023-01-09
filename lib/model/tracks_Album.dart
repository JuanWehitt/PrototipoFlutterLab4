// To parse this JSON data, do
//
//     final tracksAlbum = tracksAlbumFromJson(jsonString);

import 'dart:convert';

class TracksAlbumModel {
  static TracksAlbumData fromJson(String str) =>
      TracksAlbumData.fromJson(json.decode(str));
}

class TracksAlbumData {
  int code;
  String status;
  Data data;

  TracksAlbumData({
    required this.code,
    required this.status,
    required this.data,
  });

  factory TracksAlbumData.fromJson(Map<String, dynamic> json) =>
      TracksAlbumData(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String href;
  List<Item> items;
  int total;

  Data({
    required this.href,
    required this.items,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        total: json["total"],
      );
}

class Item {
  List<Artist> artists;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String previewUrl;
  int trackNumber;
  String uri;

  Item({
    required this.artists,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.previewUrl,
    required this.trackNumber,
    required this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
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
