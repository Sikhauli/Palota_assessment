// import 'package:flutter/material.dart';
// import 'package:flutter_spotify_africa_assessment/colors.dart';
// import 'package:flutter_spotify_africa_assessment/routes.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SpotifyCategory extends StatefulWidget {
//   final String categoryId;

//   const SpotifyCategory({
//     Key? key,
//     required this.categoryId,
//   }) : super(key: key);

//   @override
//   _SpotifyCategoryState createState() => _SpotifyCategoryState();
// }

// class _SpotifyCategoryState extends State<SpotifyCategory> {
//   List<dynamic> playlistData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final data = await fetchPlaylistData(widget.categoryId);
//       setState(() {
//         playlistData = data;
//       });
//     } catch (e) {
//       // Handle error here
//       print('Error fetching playlist data: $e');
//     }
//   }

  
//    Future<List<dynamic>> fetchPlaylistData(String categoryId) async {
//   final url = Uri.parse('https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro/playlists');
//   final response = await http.get(url, headers: {'x-functions-key': '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ=='});

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     final playlists = data['playlists']['items'] as List<dynamic>; // Extract the 'items' key from the playlists object
//     return playlists;
//   } else {
//     throw Exception('Failed to fetch playlist data');
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("Afro"),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.info_outline),
//           onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
//         ),
//       ],
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: <Color>[
//               AppColors.blue,
//               AppColors.cyan,
//               AppColors.green,
//             ],
//           ),
//         ),
//       ),
//     ),
//     body: Container(
//       padding: const EdgeInsets.all(16),
//       child: playlistData.isNotEmpty
//           ? GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, 
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemCount: playlistData.length,
//               itemBuilder: (context, index) {
//                 final playlist = playlistData[index];
//                 final imageUrl = playlist['images'][0]['url']; 
//                 final name = playlist['name'];

//                 return GestureDetector(
//                   onTap: () {
//                     // Handle playlist tap here
//                     // You can navigate to a playlist detail screen or perform any other action


//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[600],
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           spreadRadius: 2,
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             imageUrl,
//                             fit: BoxFit.cover,
//                             width: double.infinity, 
//                             height: 140, 
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Text(
//                             name,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     ),
//   );
// }
// }












import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyCategory extends StatefulWidget {
  final String categoryId;

  const SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  _SpotifyCategoryState createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory> {
  List<dynamic> playlistData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await fetchPlaylistData(widget.categoryId);
      setState(() {
        playlistData = data;
      });
    } catch (e) {
      // Handle error here
      print('Error fetching playlist data: $e');
    }
  }

  Future<List<dynamic>> fetchPlaylistData(String categoryId) async {
    final url = Uri.parse(
        'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro/playlists');
    final response = await http.get(url,
        headers: {'x-functions-key': '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ=='});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final playlists = data['playlists']['items'] as List<dynamic>;
      return playlists;
    } else {
      throw Exception('Failed to fetch playlist data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Afro"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.about),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                AppColors.blue,
                AppColors.cyan,
                AppColors.green,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: playlistData.isNotEmpty
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: playlistData.length,
                itemBuilder: (context, index) {
                  final playlist = playlistData[index];
                  final imageUrl = playlist['images'][0]['url'];
                  final name = playlist['name'];

                  return GestureDetector(
                    onTap: () {
                    
                      Navigator.of(context).pushNamed(
                        AppRoutes.spotifyPlaylist,
                        arguments: {
                          'categoryId': widget.categoryId,
                          'playlistId': playlist['id'],
                          'imageUrl'  : imageUrl,
                          'playlistName':  name,
                          'description': playlist['description'],
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 140,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
