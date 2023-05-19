
// import 'package:flutter/material.dart';
// import 'package:flutter_spotify_africa_assessment/features/about/presentation/pages/about.dart';
// import 'package:flutter_spotify_africa_assessment/features/landing/presentation/pages/landing.dart';
// import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/pages/spotify_category.dart';
// import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/pages/spotify_playlist.dart';


// class AppRoutes {
//   /// App start up (loading) page
//   static const String startUp = '/';

//   /// App start up (loading) page
//   static const String about = '/about';

//   /// Spotify Category Page
//   static const String spotifyCategory = '/spotify/category';

//   /// Spotify Playlist Page
//     static const String spotifyPlaylist = '/spotify/playlist';


//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case startUp:
//         return MaterialPageRoute(
//           builder: (BuildContext context) => const LandingPage(),
//           settings: settings,
//         );
//       case about:
//         return MaterialPageRoute(
//           builder: (BuildContext context) => const AboutPage(),
//           settings: settings,
//         );
//       case spotifyCategory:
//         final String? categoryId = settings.arguments as String?;
//         return MaterialPageRoute(
//           builder: (BuildContext context) => SpotifyCategory(
//             categoryId: categoryId ?? '', // Provide a default value for nullable categoryId
//           ),
//           settings: settings,
//         );
//          case spotifyPlaylist:
//         final String? categoryId = settings.arguments as String?;
//         return MaterialPageRoute(
//           builder: (BuildContext context) => SpotifyPlaylist(
//             categoryId: categoryId ?? '', // Provide a default value for nullable categoryId
//           ),
//           settings: settings,
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (BuildContext context) => Scaffold(
//             appBar: AppBar(
//               title: const Text('Error'),
//             ),
//             body: Center(
//               child: Text('Page not found'),
//             ),
//           ),
//           settings: settings,
//         );
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/pages/about.dart';
import 'package:flutter_spotify_africa_assessment/features/landing/presentation/pages/landing.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/pages/spotify_category.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/pages/spotify_playlist.dart';

class AppRoutes {
  static const String startUp = '/';
  static const String about = '/about';
  static const String spotifyCategory = '/spotify/category';
  static const String spotifyPlaylist = '/spotify/playlist';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LandingPage(),
          settings: settings,
        );
      case about:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AboutPage(),
          settings: settings,
        );
      case spotifyCategory:
        final String? categoryId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (BuildContext context) => SpotifyCategory(
            categoryId: categoryId ?? '',
          ),
          settings: settings,
        );
      case spotifyPlaylist:
        final Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
        final String playlistId = arguments?['playlistId'] ?? '';
        final String playlistName = arguments?['playlistName'] ?? '';
        final String description = arguments?['description'] ?? '';
        final String imageUrl = arguments?['imageUrl'] ?? '';
        return MaterialPageRoute(
          builder: (BuildContext context) => SpotifyPlaylist(
            playlistId: playlistId,
            playlistName: playlistName,
            imageUrl: imageUrl,
            description: description,
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: Center(
              child: Text('Page not found'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
