import 'package:flutter/material.dart';
import 'package:songs_app/src/features/common/service/songs_service.dart';

class SongCard extends StatelessWidget {
  final String id;
  final String title;
  final bool isFavourite;
  const SongCard({
    super.key,
    required this.id,
    required this.title,
    required this.isFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.music_note),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: isFavourite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            FirebaseHelpers.toggleFavourite(
              id,
              isFavourite,
            );
          },
        ),
      ),
    );
  }
}
