// To parse this JSON data, do
import 'dart:convert';

List<PhotoAlbum> photoFromJson(String str) =>
    List<PhotoAlbum>.from(json.decode(str).map((x) => PhotoAlbum.fromJson(x)));

String photoToJson(List<PhotoAlbum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoAlbum {
  PhotoAlbum({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory PhotoAlbum.fromJson(Map<String, dynamic> json) => PhotoAlbum(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
