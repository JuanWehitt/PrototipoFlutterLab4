//     final ArtistModel = ArtistModelFromJson(jsonString);
import 'package:prototipo_flutter_lab4/model/artist_data.dart';
import 'dart:convert';

//String ArtistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
  static ArtistData fromJson(String str) =>
      ArtistData.fromJson(json.decode(str));
}
