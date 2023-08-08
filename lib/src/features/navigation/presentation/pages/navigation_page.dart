import 'package:flutter/material.dart';
import 'package:songs_app/src/features/common/service/songs_service.dart';
import 'package:songs_app/src/features/favourites/presentation/pages/favourites_page.dart';
import 'package:songs_app/src/features/home/presentation/pages/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  TextEditingController songTitleController = TextEditingController();
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    HomePage(),
    FavouritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Add a new song',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: songTitleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Song title',
                          ),
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              FirebaseHelpers.addSong(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                if (songTitleController.text
                                    .trim()
                                    .isNotEmpty) {
                                  FirebaseHelpers.addSong(
                                      songTitleController.text);
                                  songTitleController.clear();

                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Add'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add your cancel logic here
                                Navigator.pop(context);
                                songTitleController.clear();
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
