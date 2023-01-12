class Artists {
  String name;

  Artists({
    required this.name,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        name: json["name"],
      );
}
