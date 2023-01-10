class Track {
  List<Artist> artists;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String previewUrl;
  int trackNumber;
  String uri;

  Track({
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

  factory Track.fromJson(Map<String, dynamic> json) => Track(
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
