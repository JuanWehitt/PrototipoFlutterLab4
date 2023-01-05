class ArtistData {
  ExternalUrls externalUrls;
  Followers followers;
  //int followers;
  String href;
  String id;
  List<Image> images;
  String name;
  int popularity;

  ArtistData({
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
  });

  factory ArtistData.fromJson(Map<String, dynamic> json) => ArtistData(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        //followers: json["followers"]["total"],
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
      );
}

class ExternalUrls {
  String spotify;

  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"] == null ? null : json["spotify"],
      );
}

class Followers {
  String href;
  int total;

  Followers({
    this.href = "",
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"] == null ? null : json["href"],
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
