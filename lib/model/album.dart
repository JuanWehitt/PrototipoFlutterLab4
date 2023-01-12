import 'artists.dart';

class Album {
  List<Artists> artists;
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
        artists:
            List<Artists>.from(json["artists"].map((x) => Artists.fromJson(x))),
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
