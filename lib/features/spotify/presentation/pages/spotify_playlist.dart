
// import 'package:flutter/material.dart';

// class SpotifyPlaylist extends StatelessWidget {
//   final String playlistId;
//   final String playlistName;
//   final String imageUrl;
//   final String description;

//   const SpotifyPlaylist({
//     Key? key,
//     required this.playlistId,
//     required this.playlistName,
//     required this.imageUrl,
//     required this.description,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Playlist'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.35, // 15% of screen height
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               image: DecorationImage(
//                 image: NetworkImage(imageUrl),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Align(
//               alignment: Alignment.bottomLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   playlistName,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Text(
//                     description,
//                     style: const TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
                  
//                   Text('Playlist ID: $playlistId'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpotifyPlaylist extends StatefulWidget {
  final String playlistId;
  final String playlistName;
  final String imageUrl;
  final String description;

  const SpotifyPlaylist({
    Key? key,
    required this.playlistId,
    required this.playlistName,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  _SpotifyPlaylistState createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  late Future<List<dynamic>> _fetchPlaylistData;

  @override
  void initState() {
    super.initState();
    _fetchPlaylistData = _fetchDataFromAPI();
  }

  Future<List<dynamic>> _fetchDataFromAPI() async {
    final headers = {
      'x-functions-key': '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
      Uri.parse('https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/playlists/${widget.playlistId}'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['playlistItems'] as List<dynamic>;
    } else {
      throw Exception('Failed to load playlist data');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget playlistImage;
    if (widget.imageUrl.isNotEmpty) {
      playlistImage = Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.playlistName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      playlistImage = Container(
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.grey[200],
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.playlistName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
      ),
      body: Column(
        children: [
          playlistImage,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<dynamic>>(
                future: _fetchPlaylistData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final playlistItems = snapshot.data;
                    return Column(
                      children: [
                        Text(
                          widget.description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text('Playlist ID: ${widget.playlistId}'),
                        const SizedBox(height: 16),
                        Text('Playlist Items:'),
                        Expanded(
                          child: ListView.builder(
                            itemCount: playlistItems?.length,
                            itemBuilder: (context, index) {
                              final item = playlistItems?[index];
                              return ListTile(
                                title: Text(item['name']),
                                subtitle: Text(item['artist']),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
