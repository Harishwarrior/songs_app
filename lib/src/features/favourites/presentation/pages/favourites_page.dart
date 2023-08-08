import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songs_app/src/features/common/presentation/widgets/song_card.dart';
import 'package:songs_app/src/features/common/providers/songs_provider.dart';

/// Shows the songs which are marked as favourite
class FavouritesPage extends ConsumerWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final songStream = ref.watch(songProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: songStream.when(
        data: (songs) {
          final favouriteSongs =
              songs.where((song) => song.isFavourite).toList();

          return favouriteSongs.isNotEmpty
              ? ListView.builder(
                  itemCount: favouriteSongs.length,
                  itemBuilder: (context, index) {
                    return SongCard(
                      id: favouriteSongs[index].id,
                      title: favouriteSongs[index].title,
                      isFavourite: favouriteSongs[index].isFavourite,
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
                        'Tap the like icon in home page to add to favourites',
                      ),
                    ],
                  ),
                );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
