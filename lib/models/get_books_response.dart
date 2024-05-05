import 'dart:convert';

GetBooksResponse getBooksResponseFromJson(String str) =>
    GetBooksResponse.fromJson(json.decode(str));

String getBooksResponseToJson(GetBooksResponse data) =>
    json.encode(data.toJson());

class GetBooksResponse {
  String? kind;
  int? totalItems;
  List<Item> items;

  GetBooksResponse({
    this.kind,
    this.totalItems,
    required this.items,
  });

  factory GetBooksResponse.fromJson(Map<String, dynamic> json) =>
      GetBooksResponse(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String? id;
  VolumeInfo? volumeInfo;
  Item({
    this.id,
    this.volumeInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        volumeInfo: json["volumeInfo"] == null
            ? null
            : VolumeInfo.fromJson(json["volumeInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "volumeInfo": volumeInfo?.toJson(),
      };
}

class VolumeInfo {
  String? title;
  List<String>? authors;
  ImageLinks? imageLinks;
  VolumeInfo({
    this.title,
    required this.authors,
    this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: json["authors"] == null
            ? []
            : List<String>.from(json["authors"].map((x) => x)),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromJson(json["imageLinks"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": List<dynamic>.from(authors!.map((x) => x)),
        "imageLinks": imageLinks?.toJson(),
      };
}

class ImageLinks {
  String? thumbnail;

  ImageLinks({
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
      };
}
