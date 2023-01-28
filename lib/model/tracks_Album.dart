import 'dart:convert';

import 'track.dart';

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
  List<Track> items;
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
            : List<Track>.from(json["items"].map((x) => Track.fromJson(x))),
        total: json["total"],
      );
}
