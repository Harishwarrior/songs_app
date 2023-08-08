import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/features/common/domain/model/songs.dart';

/// Retrieves all the songs from 'songs' collection from Firebase firestore
/// and maps it list of [Song] object
final songProvider = StreamProvider.autoDispose<List<Song>>((ref) {
  return FirebaseFirestore.instance
      .collection('songs')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return Song.fromDocument(doc);
    }).toList();
  });
});
