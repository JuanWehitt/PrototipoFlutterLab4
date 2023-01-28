import 'artists.dart';

class Track {
  List<Artists> artists;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String previewUrl;
  int trackNumber;
  String uri;
  int duration_ms;
  bool favorite = false;

  Track(
      {required this.artists,
      required this.explicit,
      required this.externalUrls,
      required this.href,
      required this.id,
      required this.name,
      required this.previewUrl,
      required this.trackNumber,
      required this.uri,
      required this.duration_ms});

  factory Track.fromJson(Map<String, dynamic> json) => Track(
      artists: json["artists"] == null
          ? []
          : List<Artists>.from(json["artists"].map((x) => Artists.fromJson(x))),
      explicit: json["explicit"],
      externalUrls: ExternalUrls.fromJson(json["external_urls"]),
      href: json["href"],
      id: json["id"],
      name: json["name"],
      previewUrl: json["preview_url"],
      trackNumber: json["track_number"],
      uri: json["uri"],
      duration_ms: json["duration_ms"]);
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
