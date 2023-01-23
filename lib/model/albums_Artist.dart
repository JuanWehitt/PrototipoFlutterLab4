// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

import 'album.dart';

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
