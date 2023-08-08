import 'package:cloud_firestore/cloud_firestore.dart';

/// Helper class to add or modify songs in firebase
class FirebaseHelpers {
  /// Adds a song to 'songs' collection
  static Future<void> addSong(String title) {
    return FirebaseFirestore.instance.collection('songs').add({
      'title': title,
      'isFavourite': false,
    });
  }

  /// Make a song favourite
  static Future<void> toggleFavourite(String id, bool isFavourite) {
    return FirebaseFirestore.instance.collection('songs').doc(id).update({
      'isFavourite': !isFavourite,
    });
  }
}
