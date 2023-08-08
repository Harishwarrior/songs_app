import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  /// Unique ID of the song
  final String id;

  /// Title of the song
  final String title;

  /// Whether this song is marked as favourite or not
  final bool isFavourite;

  const Song({
    required this.id,
    required this.title,
    this.isFavourite = false,
  });

  factory Song.fromDocument(DocumentSnapshot doc) {
    return Song(
      id: doc.id,
      title: doc['title'],
      isFavourite: doc['isFavourite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isFavourite': isFavourite,
    };
  }
}
