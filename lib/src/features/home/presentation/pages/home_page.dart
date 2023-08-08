import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/features/common/presentation/widgets/song_card.dart';
import 'package:songs_app/src/features/common/providers/songs_provider.dart';

/// Shows all the songs in a listview
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final songStream = ref.watch(songProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: songStream.when(
        data: (songs) {
          return songs.isNotEmpty
              ? ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    return SongCard(
                      id: songs[index].id,
                      title: songs[index].title,
                      isFavourite: songs[index].isFavourite,
                    );
                  },
                )
              : const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 80,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Tap the + icon below to add a song',
                      ),
                    ],
                  ),
                );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
          ),
        ),
      ),
    );
  }
}
